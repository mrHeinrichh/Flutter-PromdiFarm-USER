import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:promdifarm_app/data/models/index.dart';
import 'package:promdifarm_app/view/bloc/index.dart';
import 'package:promdifarm_app/view/widgets/shared.dart';
import 'package:promdifarm_app/view/widgets/deliveries/index.dart';

class DeliveriesPage extends StatelessWidget {
  final FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Shared.template(
        context: context,
        body: BlocConsumer<DeliveriesCubit, DeliveriesState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is DeliveriesInitial) {
              BlocProvider.of<DeliveriesCubit>(context)
                  .getAvailableDeliveries();
            }

            if (state is DeliveriesLoading) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }

            if (state is DeliveriesFail) {
              _toast(msg: state.error.message);
            }

            return Scaffold(
              body: setOrderList(state.deliveries),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.refresh_outlined),
                backgroundColor: Colors.green,
                onPressed: () {
                  BlocProvider.of<DeliveriesCubit>(context)
                      .getAvailableDeliveries();
                },
              ),
            );
          },
        ),
        title: "Deliveries",
      ),
    );
  }

  _toast({msg = ""}) {
    fToast.showToast(
      child: Shared.toast(text: msg),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  Widget setOrderList(List<Delivery> deliveries) {
    return deliveries.length == 0
        ? NoPendingScreen()
        : OrderList(deliveries: deliveries);
  }
}
