import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:promdifarm_app/core/errors/failures.dart';
import 'package:promdifarm_app/data/models/index.dart';
import 'package:promdifarm_app/domain/repositories/index.dart';
part 'deliveries.state.dart';

class DeliveriesCubit extends Cubit<DeliveriesState> {
  final DeliveriesRepository repository;

  DeliveriesCubit({required this.repository}) : super(DeliveriesInitial());

  void getAvailableDeliveries() {
    emit(DeliveriesLoading());

    repository.listDeliveries().then(
      (res) {
        res.fold(
          (failure) => emit(DeliveriesFail(
            deliveries: repository.list,
            error: failure,
          )),
          (success) => emit(GetDeliveriesSuccess(success)),
        );
      },
    );
  }

  void acceptDelivery({required String id}) async {
    emit(DeliveriesLoading());

    repository.acceptDelivery(id).then(
      (res) {
        res.fold(
          (failure) => emit(DeliveriesFail(
            deliveries: repository.list,
            error: failure,
          )),
          (success) => emit(AcceptDeliverySuccess(success)),
        );
      },
    );
  }
}
