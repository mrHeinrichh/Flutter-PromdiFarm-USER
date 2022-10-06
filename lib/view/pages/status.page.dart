import 'package:flutter/material.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/core/const/index.dart';
import 'package:promdifarm_app/view/widgets/shared.dart';
import 'package:go_router/go_router.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Shared.template(
        context: context,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              head(context),
              description(context),
            ],
          ),
        ),
        title: "Status",
      ),
    );
  }

  Widget head(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(55),
          color: NEUTRAL_PRIMARY_ACCENT,
          child: Column(
            children: [
              Text(
                "Current Status",
                style: TextStyle(
                  color: NEUTRAL_PRIMARY_NORMAL,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Not Working",
                style: TextStyle(
                  color: TEXT_PRIMARY,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget description(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ...sentence(),
          Shared.button(
              width: 306,
              title: "I'M AVAILABLE",
              height: 48,
              onPressed: () {
                context.goNamed(ROUTE.DELIVERIES);
              })
        ],
      ),
    );
  }

  List<Widget> sentence() {
    List<Widget> text = [
      Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Text(
          " You can spontaneously offer to work when you don't have any scheduled shifts.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Text(
          "If you're interested in working now, let us know and the Dispatchers will give you a call if we need more riders. You'll get a notification in just under 2 hours asking if you would like to stay available, otherwise your availability will expire.",
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ];

    return text
        .map(
          (e) => Container(
            margin: EdgeInsets.only(bottom: 10),
            child: e,
          ),
        )
        .toList();
  }
}
