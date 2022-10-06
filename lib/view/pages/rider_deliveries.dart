import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/core/const/index.dart';
import 'package:promdifarm_app/view/bloc/index.dart';
import 'package:go_router/go_router.dart';

class RiderDeliveries extends StatelessWidget {
  const RiderDeliveries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .95;

    return Scaffold(
      backgroundColor: NEUTRAL_PRIMARY_ACCENT,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Deliveries"),
        backgroundColor: PRIMARY,
        leading: GestureDetector(
          onTap: () {
            context.goNamed(ROUTE.STATUS);
          },
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      bottomNavigationBar: Container(
        child: Stack(
          children: [
            Container(
              height: 560.0,
              color: TEXT_LIGHT,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(18, 20, 16, 0),
              child: Text(
                "All Transactions (25)",
                style: TextStyle(
                    fontSize: 15,
                    color: NEUTRAL_PRIMARY_NORMAL,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  transac(context,
                      Date: "Friday, 1 April 2022",
                      Amount: "+P475.00",
                      bookingNum: "Booking No. 32132131"),
                  transac(context,
                      Date: "Friday, 1 April 2022",
                      Amount: "+P475.00",
                      bookingNum: "Commision No. 32132131"),
                  transac(context,
                      Date: "Friday, 1 April 2022",
                      Amount: "+P475.00",
                      bookingNum: "Booking No. 32132131"),
                  transac(context,
                      Date: "Friday, 1 April 2022",
                      Amount: "+P475.00",
                      bookingNum: "Booking No. 32132131"),
                  transac(context,
                      Date: "Friday, 1 April 2022",
                      Amount: "+P475.00",
                      bookingNum: "Booking No. 32132131"),
                  transac(context,
                      Date: "Friday, 1 April 2022",
                      Amount: "+P475.00",
                      bookingNum: "Booking No. 32132131"),
                ],
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<DeliveriesCubit, DeliveriesState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.fromLTRB(10, 20, 11, 0),
            child: Column(
              children: [
                availableBalance(),
                Container(
                  child: topUp(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget availableBalance() {
    return Container(
      child: Column(
        children: [
          Text(
            "Available Balance",
            style: TextStyle(
              fontSize: 12,
              color: NEUTRAL_PRIMARY_NORMAL,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₱",
                style: TextStyle(
                    fontSize: 20,
                    color: TEXT_PRIMARY,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                height: 40,
                child: Text(
                  "1,300",
                  style: TextStyle(
                      fontSize: 40,
                      color: TEXT_PRIMARY,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                ".00",
                style: TextStyle(
                    fontSize: 20,
                    color: TEXT_PRIMARY,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget topUp() {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        alignment: FractionalOffset(.5, .30),
        children: [
          Container(
            height: 90.0,
          ),
          ButtonTheme(
            minWidth: 120.0,
            height: 40,
            padding: const EdgeInsets.only(bottom: .70),
            child: RaisedButton(
              onPressed: () {},
              color: PRIMARY,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "TOP-UP",
                style: TextStyle(color: TEXT_LIGHT, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget transac(BuildContext context,
      {String Date = "", Amount = "", bookingNum}) {
    return Container(
      margin: EdgeInsets.fromLTRB(18, 1, 16, 0),
      height: 80,
      width: 400,
      child: Container(
        child: GestureDetector(
          onTap: () {
            context.goNamed(ROUTE.TRANSACTION);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: NEUTRAL_PRIMARY_BASE, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 17, 15, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Date,
                        style: TextStyle(
                            color: NEUTRAL_PRIMARY_NORMAL,
                            fontWeight: FontWeight.w700),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Amount,
                              textAlign: TextAlign.end,
                              style: TextStyle(color: NEUTRAL_PRIMARY_NORMAL)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        bookingNum,
                        style: TextStyle(color: NEUTRAL_PRIMARY_NORMAL),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
