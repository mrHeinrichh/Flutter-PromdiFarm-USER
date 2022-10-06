part of 'deliveries.cubit.dart';

@immutable
abstract class DeliveriesState {
  final List<Delivery> deliveries;
  DeliveriesState({this.deliveries = const []});
}

// Initial state
class DeliveriesInitial extends DeliveriesState {}

// Has an error
class DeliveriesFail extends DeliveriesState {
  final Failure error;
  final List<Delivery> deliveries;
  DeliveriesFail({required this.error, required this.deliveries})
      : super(deliveries: deliveries);
}

class DeliveriesLoading extends DeliveriesState {}

class DeliveriesLoaded extends DeliveriesState {
  final List<Delivery> deliveries;
  DeliveriesLoaded(this.deliveries) : super(deliveries: deliveries);
}

class GetDeliveriesSuccess extends DeliveriesState {
  final List<Delivery> deliveries;
  GetDeliveriesSuccess(this.deliveries) : super(deliveries: deliveries);
}

class AcceptDeliverySuccess extends DeliveriesState {
  final AcceptDelivery delivery;
  AcceptDeliverySuccess(this.delivery);
}
