import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

abstract class MapSource {
  Future<List<PointLatLng>> updateRoute({
    required LocationData cLoc,
    required List<PointLatLng> points,
  });
}
