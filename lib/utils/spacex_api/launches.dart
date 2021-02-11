import 'dart:convert';
import 'package:http/http.dart';
import 'package:spacex_today/models/launch_data.dart';
import 'package:http/http.dart' as http;

enum LaunchesFactoryEnum {
  PAST,
  UPCOMING,
}

class LaunchesApi {
  static final LaunchesApi _launchesApi = LaunchesApi._internal();
  String _baseUrl = "https://api.spacexdata.com/v4";
  List<LaunchData> _pastLaunchesList;
  List<LaunchData> _upcomingLaunchesList;

  factory LaunchesApi() {
    return _launchesApi;
  }

  LaunchesApi._internal();

  Future<List<LaunchData>> requestPastLaunchesList() async {
    if (_pastLaunchesList == null) {
      await refreshPastLaunchesList();
    }
    return _pastLaunchesList;
  }

  Future<List<LaunchData>> refreshPastLaunchesList() async {
    final response = await _getListResponse('/launches/past');
    if (response.isNotEmpty || _pastLaunchesList == null) {
      _pastLaunchesList = response;
    }

    return _pastLaunchesList;
  }

  List<LaunchData> getPastLaunchesList() {
    if (_pastLaunchesList == null) {
      _pastLaunchesList = List<LaunchData>();
      refreshPastLaunchesList();
    }
    return _pastLaunchesList;
  }


  Future<List<LaunchData>> requestUpcomingLaunchesList() async {
    if (_upcomingLaunchesList == null) {
      await refreshUpcomingLaunchesList();
    }
    return _upcomingLaunchesList;
  }

  Future<List<LaunchData>> refreshUpcomingLaunchesList() async {
    final response = await _getListResponse('/launches/upcoming');
    if (response.isNotEmpty || _upcomingLaunchesList == null) {
      _upcomingLaunchesList = response;
    }

    return _upcomingLaunchesList;
  }

  List<LaunchData> getUpcomingLaunchesList() {
    if (_upcomingLaunchesList == null) {
      _upcomingLaunchesList = List<LaunchData>();
      refreshPastLaunchesList();
    }
    return _upcomingLaunchesList;
  }

  

  Future<List<LaunchData>> _getListResponse(String url) async {
    Response response;
    try {
      response = await http.get('$_baseUrl$url');
    } on ClientException catch (error) {
      return new List<LaunchData>();
    }

    final parsed = jsonDecode(response.body) as List;
    return parsed.map((json) => LaunchData.fromJson(json)).toList();
  }


}
