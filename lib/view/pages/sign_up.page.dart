import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:promdifarm_app/core/const/color.dart';
import 'package:promdifarm_app/core/const/numbers.dart';
import 'package:promdifarm_app/view/bloc/index.dart';
import 'package:promdifarm_app/view/widgets/shared.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatelessWidget {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _email = TextEditingController();
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
        body: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is CreateUserSuccess) {
              _show(msg: state.msg);
              context.goNamed("login");
            }

            if (state is CreateUserFail) {
              _show(msg: state.msg);
            }
          },
          child: body(context),
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

  Widget body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          header(),
          form(),
          Shared.button(
            height: 56,
            width: 186,
            title: "Sign Up",
            onPressed: () {
              BlocProvider.of<UserCubit>(context).createUser(
                firstName: _firstName.text,
                lastName: _lastName.text,
                phoneNumber: _phoneNumber.text,
                email: _email.text,
              );
            },
          ),
          signUp(context),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      child: Column(
        children: [
          Image(
            image: AssetImage("assets/logo.png"),
            height: 121 * 0.9,
            width: 76 * 0.9,
          ),
          Text(
            "Sign up",
            style: TextStyle(
              fontFamily: "Roboto",
              color: TEXT_DARK,
              fontSize: 30 * 0.9,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Create your account",
            style: TextStyle(
              fontFamily: "Roboto",
              color: TEXT_PRIMARY,
              fontSize: 16 * 0.9,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shared.textField(
              controller: _firstName,
              width: FIELD_WIDTH,
              label: "First Name",
            ),
            SizedBox(
              height: 20,
            ),
            Shared.textField(
              controller: _lastName,
              width: FIELD_WIDTH,
              label: "Last Name",
            ),
            SizedBox(
              height: 20,
            ),
            Shared.textField(
              controller: _phoneNumber,
              width: FIELD_WIDTH,
              label: "Phone number",
            ),
            SizedBox(
              height: 20,
            ),
            Shared.textField(
              controller: _email,
              width: FIELD_WIDTH,
              label: "Email",
            ),
          ],
        ),
      ),
    );
  }

  Widget signUp(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Already have an account? ",
              style: TextStyle(
                fontFamily: "Roboto",
                color: TEXT_PRIMARY,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: 'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: PRIMARY,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.goNamed("login");
                },
            ),
          ],
        ),
      ),
    );
  }
}
