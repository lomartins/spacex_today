import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex_today/models/launch_data.dart';

class LaunchView extends StatelessWidget {
  final LaunchData _launchData;

  const LaunchView(this._launchData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_launchData.name ?? ''),
        backgroundColor: Color.fromRGBO(0, 82, 136, 100.0),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List<Widget>.generate(_launchData.links.flickr.original.length, (index) => Image.network(_launchData.links.flickr.original[index])),
            ),
          ),
        ],
      ),
    );
  }
}
