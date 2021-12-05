import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/loading_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text)) {
        Navigator.of(context).pushReplacementNamed("/home");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Gagal Registrasi",
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
            "Register",
            style:
                primaryTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
          SizedBox(height: 2),
          Text(
            "Register and Happy Shoping",
            style: thirdTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
          ),
        ],
      );
    }

    Widget fullnameInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Full Name",
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
                    "assets/icon_name.png",
                    width: 17,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                    controller: nameController,
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                        hintText: "Your Full Name", hintStyle: thirdTextStyle),
                  ))
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget usernameInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username",
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
                    "assets/icon_username.png",
                    width: 17,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                    controller: usernameController,
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                        hintText: "Your Username", hintStyle: thirdTextStyle),
                  ))
                ],
              ),
            ),
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

    Widget signupButton() {
      return Container(
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: handleSignUp,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            "Sign Up",
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
      );
    }

    Widget signin() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account? ",
            style: thirdTextStyle,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/sign-in");
            },
            child: Text(
              "Sign In",
              style: TextStyle(color: primaryColor, fontWeight: medium),
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: bgColor1,
          resizeToAvoidBottomInset: true,
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: defaultMargin),
            child: ListView(
              children: [
                header(),
                SizedBox(height: 70),
                fullnameInput(),
                SizedBox(height: 20),
                usernameInput(),
                SizedBox(height: 20),
                emailInput(),
                SizedBox(height: 20),
                passwordInput(),
                SizedBox(height: 30),
                isLoading ? LoadingButton() : signupButton(),
                Spacer(),
                signin(),
              ],
            ),
          )),
    );
  }
}
