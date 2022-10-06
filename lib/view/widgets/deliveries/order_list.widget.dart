import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/data/models/index.dart';
import 'package:flutter/material.dart';
import 'order_card.widget.dart';

class OrderList extends StatelessWidget {
  final List<Delivery> deliveries;
  const OrderList({Key? key, required this.deliveries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title(),
            ...this
                .deliveries
                .map(
                  (delivery) => OrderCard(delivery: delivery),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      padding: EdgeInsets.only(bottom: 15.0),
      child: Text(
        "New Order",
        style: TextStyle(
          color: TEXT_PRIMARY,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
