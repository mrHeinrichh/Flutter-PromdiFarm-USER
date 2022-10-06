import 'package:flutter/material.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/core/const/index.dart';
import 'package:promdifarm_app/data/models/index.dart';
import 'package:promdifarm_app/view/widgets/shared.dart';
import 'package:go_router/go_router.dart';

class OrderCard extends StatelessWidget {
  final Delivery delivery;

  const OrderCard({Key? key, required this.delivery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Column(
              children: [
                orderText(title: "Order#: ", value: this.delivery.id),
              ],
            ),
          ),
          Shared.button(
            width: 318,
            height: 29,
            title: "ACCEPT",
            onPressed: () {
              context.goNamed(
                ROUTE.MAP,
                params: {'id': this.delivery.id.toString()},
              );
            },
          )
        ],
      ),
    );
  }

  Widget orderText({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: TEXT_PRIMARY,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          value,
          style: TextStyle(
            color: TEXT_PRIMARY,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
