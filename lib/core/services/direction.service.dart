import 'dart:convert';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:promdifarm_app/core/const/strings.dart';
import 'package:promdifarm_app/core/errors/failures.dart';

class DirectionsService {
  List<LatLng> _waypoints = [];

  get waypoints => _waypoints;

  Future<List<PointLatLng>> getDirections({
    required LatLng origin,
    required LatLng destination,
    List<LatLng> waypoints = const [],
  }) async {
    _waypoints = waypoints;
    String origParam = _createLocParam('origin', origin);
    String destParam = '&${_createLocParam('destination', destination)}';
    String wpParam = '&${_createWayPointString(_waypoints)}';
    String optimize = '&optimizeWaypoints=true';
    String directionAPI = GOOGLE.DIRECTION_API;
    String key = '&key=${GOOGLE.KEY}';

    http.Response response = await http.get(
      Uri.parse('$directionAPI$origParam$destParam$wpParam$optimize$key'),
    );

    dynamic json = jsonDecode(response.body);

    if (json['status'] != 'OK') {
      throw RequestFailure(json['error_message']);
    }

    return PolylinePoints()
        .decodePolyline(json['routes'][0]['overview_polyline']['points']);
  }

  _createWayPointString(List<LatLng> waypoints) {
    List<String> _waypoints = [];

    waypoints.forEach(
      (waypoint) => _waypoints.add(_createLatLngString(waypoint)),
    );

    return 'waypoints=${_waypoints.join('|')}';
  }

  _createLatLngString(LatLng latLng) {
    String lat = latLng.latitude.toString();
    String lng = latLng.longitude.toString();
    return '$lat,$lng';
  }

  _createLocParam(String prefix, LatLng latLng) {
    return '$prefix=${_createLatLngString(latLng)}';
  }
}
