import 'package:promdifarm_app/data/models/index.dart';

abstract class DeliverySource {
  static List<Delivery> list = [];
  Future<List<Delivery>> fetchAvailableDeliveries();
  List<Delivery> getDeliveries();
  Future<AcceptDelivery> acceptDelivery(String id);
}
