import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:promdifarm_app/core/errors/failures.dart';
import 'package:promdifarm_app/domain/repositories/map.repo.dart';
import 'package:promdifarm_app/domain/sources/map.src.dart';

class MapRepositoryImp extends MapRepository {
  final MapSource source;

  MapRepositoryImp(this.source);

  @override
  updateRoute({
    required LocationData cLoc,
    required List<PointLatLng> points,
  }) {
    return ErrorHandler.async<List<PointLatLng>>(
      source.updateRoute(cLoc: cLoc, points: points),
    );
  }
}
