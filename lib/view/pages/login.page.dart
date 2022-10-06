import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/core/const/numbers.dart';
import 'package:promdifarm_app/core/const/strings.dart';
import 'package:promdifarm_app/view/bloc/index.dart';
import 'package:promdifarm_app/view/widgets/shared.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatelessWidget {
  final _cred = TextEditingController();
  final _pass = TextEditingController();
  final FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is AuthUserSuccess) {
              _show(msg: state.msg);
              context.goNamed(ROUTE.STATUS);
            }

            if (state is AuthUserFail) {
              _show(msg: state.msg);
            }
          },
          builder: (context, state) {
            if (state is AuthUserLoading) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
            return body(context);
          },
        ),
      ),
    );
  }

  _show({msg = ""}) {
    fToast.showToast(
      child: Shared.toast(text: msg),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
      child: Image(
        image: AssetImage("assets/promdifarm-rider.png"),
        height: 176 * 0.8,
        width: 258.12 * 0.8,
      ),
    );
  }

  Widget form() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Shared.textField(
            width: FIELD_WIDTH,
            label: "Email or phone number",
            controller: _cred,
          ),
          SizedBox(
            height: 20,
          ),
          Shared.textField(
            width: FIELD_WIDTH,
            obscureText: true,
            label: "Password",
            controller: _pass,
          ),
        ],
      ),
    );
  }

  Widget signUp(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                fontFamily: "Roboto",
                color: TEXT_PRIMARY,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: 'Sign up here',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: PRIMARY,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.goNamed(ROUTE.SIGN_UP);
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget forgot() {
    return Center(
      child: Text(
        'Or log in with',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Roboto",
          color: NEUTRAL_PRIMARY_BASE,
          fontSize: 11,
        ),
      ),
    );
  }

  Widget socials() {
    return Container(
      child: Image(
        image: AssetImage("assets/icon.png"),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(18, 20, 16, 0),
      child: Column(
        children: [
          Card(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              alignment: Alignment(0.0, -0.79),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                            color: NEUTRAL_SECONDARY_BASE,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.0,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        children: [
                          Text(
                            "Birth Date",
                            style: TextStyle(
                              color: NEUTRAL_SECONDARY_BASE,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                context.goNamed(ROUTE.RIDERPASSWORD);
              },
              child: Card(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 19.0, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Change Password",
                        style: TextStyle(fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 191),
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       header(),
    //       Text(
    //         "Log in to your account",
    //         style: TextStyle(
    //           fontFamily: "Roboto",
    //           color: TEXT_PRIMARY,
    //           fontSize: 14,
    //         ),
    //       ),
    //       form(),
    //       Shared.button(
    //         height: 56,
    //         width: 186,
    //         title: "Log In",
    //         onPressed: () {
    //           BlocProvider.of<UserCubit>(context)
    //               .loginUser(cred: _cred.text, pass: _pass.text);
    //         },
    //       ),
    //       Text(
    //         "Forgot your password?",
    //         style: TextStyle(
    //           fontFamily: "Roboto",
    //           color: NEUTRAL_PRIMARY_BASE,
    //           fontSize: 16,
    //         ),
    //       ),
    //       forgot(),
    //       socials(),
    //       signUp(context),
    //     ],
    //   ),
    // );
  }
}
