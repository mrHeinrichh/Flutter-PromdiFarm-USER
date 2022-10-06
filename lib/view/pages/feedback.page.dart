import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/core/const/index.dart';
import 'package:promdifarm_app/view/bloc/index.dart';

class pageFeedback extends StatelessWidget {
  const pageFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .95;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: NEUTRAL_PRIMARY_ACCENT,
      appBar: AppBar(
        title: Text("Feedback"),
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
            margin: EdgeInsets.fromLTRB(10, 20, 11, 0),
            child: Column(
              children: [
                Container(
                  height: 400,
                  child: Card(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                      alignment: Alignment(0.0, -0.79),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Let's talk!",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              field(title: "Full name"),
                              field(
                                title: "Email address",
                              ),
                              field(title: "Mobile Number"),
                              field(
                                  title: "What would you like to discuss?",
                                  height: 100,
                                  width: 320),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Container(
                    child: subMit(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget field({String title = "", double height = 33, double width = 310}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              color: NEUTRAL_SECONDARY_BASE,
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Container(
            width: width,
            height: height,
            child: new TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 6,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 244, 246, 248)),
            ),
          ),
        ],
      ),
    );
  }

  Widget subMit() {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        alignment: FractionalOffset(.5, .40),
        children: [
          Container(
            height: 90.0,
          ),
          ButtonTheme(
            minWidth: 360.0,
            height: 50,
            padding: const EdgeInsets.only(bottom: .70),
            child: RaisedButton(
              onPressed: () {},
              color: PRIMARY,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "SUBMIT",
                style: TextStyle(color: TEXT_LIGHT, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
