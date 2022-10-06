import 'package:dartz/dartz.dart';
import 'package:promdifarm_app/core/errors/failures.dart';
import 'package:promdifarm_app/data/models/index.dart';

abstract class DeliveriesRepository {
  List<Delivery> get list;
  Future<Either<Failure, List<Delivery>>> listDeliveries();
  Future<Either<Failure, AcceptDelivery>> acceptDelivery(String id);
}
