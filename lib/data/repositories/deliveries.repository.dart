import 'package:promdifarm_app/core/errors/failures.dart';
import 'package:promdifarm_app/data/models/index.dart';
import 'package:promdifarm_app/domain/repositories/index.dart';
import 'package:promdifarm_app/domain/sources/delivery.src.dart';

class DeliveriesRepositoryImp extends DeliveriesRepository {
  final DeliverySource source;

  DeliveriesRepositoryImp(this.source);

  List<Delivery> get list => source.getDeliveries();

  @override
  acceptDelivery(String id) {
    return ErrorHandler.async<AcceptDelivery>(
      source.acceptDelivery(id),
    );
  }

  @override
  listDeliveries() {
    return ErrorHandler.async<List<Delivery>>(
      source.fetchAvailableDeliveries(),
    );
  }
}
