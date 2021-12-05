import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/loading_button.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
          email: emailController.text, password: passwordController.text)) {
        Navigator.of(context).pushReplacementNamed("/home");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Gagal Login",
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Login",
            style:
                primaryTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
          SizedBox(height: 2),
          Text(
            "sign in to continue",
            style: thirdTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
          ),
        ],
      );
    }

    Widget emailInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email address",
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: bgColor2, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon_email.png",
                    width: 17,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                    controller: emailController,
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                        hintText: "Your Email Address",
                        hintStyle: thirdTextStyle),
                  ))
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget passwordInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Password",
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: bgColor2, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon_password.png",
                    width: 17,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                        hintText: "Your Password", hintStyle: thirdTextStyle),
                  ))
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget signinButton() {
      return Container(
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: handleSignIn,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            "Sign In",
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
      );
    }

    Widget signup() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: thirdTextStyle,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/sign-up");
            },
            child: Text(
              "Sign Up",
              style: TextStyle(color: primaryColor, fontWeight: medium),
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor1,
          resizeToAvoidBottomInset: false,
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(height: 70),
                emailInput(),
                SizedBox(height: 20),
                passwordInput(),
                SizedBox(height: 30),
                isLoading ? LoadingButton() : signinButton(),
                Spacer(),
                signup(),
              ],
            ),
          )),
    );
  }
}
