import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spacex_today/models/launch_data.dart';
import 'package:spacex_today/utils/spacex_api/launches.dart';

import 'launch.dart';

class LaunchesScreen extends StatefulWidget {
  @override
  _LaunchesScreenState createState() => _LaunchesScreenState();
}

class _LaunchesScreenState extends State<LaunchesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Lançamentos da SpaceX'),
          backgroundColor: Color.fromRGBO(0, 82, 136, 100.0),
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Historico'),
              Tab(text: 'Proximos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LaunchHistoryBody(),
            LaunchUpcomingBody(),
          ],
        ),
      ),
    );
  }
}

class LaunchHistoryBody extends StatefulWidget {
  @override
  _LaunchHistoryBodyState createState() => _LaunchHistoryBodyState();
}

class _LaunchHistoryBodyState extends State<LaunchHistoryBody> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final _pastLaunchesApi = LaunchesApi();
  List<LaunchData> launchesList;

  @override
  void initState() {
    super.initState();
    _pastLaunchesApi.requestPastLaunchesList();
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    await _pastLaunchesApi
        .refreshPastLaunchesList()
        .catchError((err) => {ConnectionErrorToast.show()});
    setState(() {
      launchesList = _pastLaunchesApi.getPastLaunchesList();
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshKey,
      child: FutureBuilder<List<LaunchData>>(
        future: _pastLaunchesApi.requestPastLaunchesList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            ConnectionErrorToast.show();
            return LaunchList(list: launchesList ?? List<LaunchData>());
          }
          if (snapshot.hasData) {
            launchesList = snapshot.data;
            return LaunchList(list: launchesList);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      onRefresh: refreshList,
    );
  }
}

class LaunchUpcomingBody extends StatefulWidget {
  @override
  _LaunchUpcomingBodyState createState() => _LaunchUpcomingBodyState();
}

class _LaunchUpcomingBodyState extends State<LaunchUpcomingBody> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  List<LaunchData> launchesList;

  @override
  void initState() {
    super.initState();
    LaunchesApi().requestUpcomingLaunchesList();
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    await LaunchesApi()
        .refreshUpcomingLaunchesList()
        .catchError((err) => {ConnectionErrorToast.show()});
    setState(() {
      launchesList = LaunchesApi().getUpcomingLaunchesList();
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshKey,
      child: FutureBuilder<List<LaunchData>>(
        future: LaunchesApi().requestUpcomingLaunchesList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            ConnectionErrorToast.show();
            return LaunchList(list: launchesList ?? List<LaunchData>());
          }
          if (snapshot.hasData) {
            launchesList = snapshot.data;
            return LaunchList(list: launchesList);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      onRefresh: refreshList,
    );
  }
}

class LaunchList extends StatelessWidget {
  final List<LaunchData> list;

  const LaunchList({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return LaunchItem(list[index]);
        });
  }
}

class LaunchItem extends StatelessWidget {
  final LaunchData _launchData;

  LaunchItem(this._launchData);

  @override
  Widget build(BuildContext context) {
    Widget image;
    if (_launchData.links.patch.small != null) {
      image = Image.network(_launchData.links.patch.small);
    } else {
      image = Icon(
        CupertinoIcons.question_circle_fill,
        size: 50,
      );
    }

    return Card(
      child: ListTile(
        title: Text(_launchData.name),
        subtitle: Text(
          _launchData.details,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
        leading: image,
        isThreeLine: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LaunchView(_launchData)),
          );
        },
      ),
    );
  }
}

class ConnectionErrorToast {
  static void show() {
    Fluttertoast.showToast(
        msg: "Problema de conexão",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 2);
  }
}
