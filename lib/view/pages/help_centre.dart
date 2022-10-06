import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/core/const/index.dart';
import 'package:promdifarm_app/view/bloc/index.dart';
import 'package:go_router/go_router.dart';

class helpCentre extends StatelessWidget {
  const helpCentre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .95;

    return Scaffold(
      backgroundColor: NEUTRAL_PRIMARY_ACCENT,
      appBar: AppBar(
        title: Text("Help Centre"),
        backgroundColor: PRIMARY,
        leading: GestureDetector(
          onTap: () {
            context.goNamed(ROUTE.STATUS);
          },
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: BlocBuilder<DeliveriesCubit, DeliveriesState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.fromLTRB(18, 20, 16, 0),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                    alignment: Alignment(0.0, -0.79),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text(
                                "How can we help?",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: NEUTRAL_PRIMARY_DARK,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        supportItem(problem: "My Orders"),
                        supportItem(problem: "Support request"),
                        supportItem(problem: "My Account"),
                        supportItem(problem: "Orders and Payment"),
                        supportItem(problem: "Get help with my pay"),
                        supportItem(problem: "Safety Concerns"),
                        supportItem(problem: "How to become a PromdiRider"),
                        supportItem(problem: "How to become a PromdiFarmer"),
                        supportItem(problem: "Selling and Billing"),
                        supportItem(problem: "Return & Refund"),
                        supportItem(problem: "FAQ"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget supportItem({String problem = ""}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                problem,
                style: TextStyle(
                  fontSize: 13,
                  color: NEUTRAL_PRIMARY_DARK,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: NEUTRAL_PRIMARY_BASE,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 1),
          Divider(color: NEUTRAL_PRIMARY_BASE)
        ],
      ),
    );
  }
}
