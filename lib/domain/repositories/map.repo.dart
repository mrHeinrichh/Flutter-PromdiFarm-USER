import 'package:dartz/dartz.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:promdifarm_app/core/errors/failures.dart';

abstract class MapRepository {
  Future<Either<Failure, List<PointLatLng>>> updateRoute({
    required LocationData cLoc,
    required List<PointLatLng> points,
  });
}
