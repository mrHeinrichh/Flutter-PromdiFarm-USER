import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:promdifarm_app/core/services/index.dart';
import 'package:promdifarm_app/domain/sources/map.src.dart';

class MapSourceImp extends MapSource {
  final DirectionsService dirService;

  MapSourceImp({required this.dirService});

  @override
  updateRoute({
    required LocationData cLoc,
    required List<PointLatLng> points,
  }) async {
    return this.dirService.getDirections(
          origin: LatLng(
            cLoc.latitude!,
            cLoc.longitude!,
          ),
          waypoints: this.dirService.waypoints,
          destination: LatLng(
            points.last.latitude,
            points.last.longitude,
          ),
        );
  }
}
