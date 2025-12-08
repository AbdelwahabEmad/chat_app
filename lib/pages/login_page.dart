import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/name_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errMessage;
  void validateAndProceed() {
    setState(() {
      if (emailAddressController.text.isEmpty && passwordController.text.isEmpty) {
        errMessage = 'please enter your email address and password';
      } else if (emailAddressController.text.isEmpty) {
        errMessage = 'please enter your email address';
      } else if (passwordController.text.isEmpty) {
        errMessage = 'please enter your password';
      } else {
        //to next page
        errMessage = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF0C151A),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFF0865FE),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(
                    'Chat App',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),
            CustomTextField(
              hintText: 'email address',
              controller: emailAddressController,
              hasError: errMessage != null && emailAddressController.text.isEmpty,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'password',
              controller: passwordController,
              hasError: errMessage != null && passwordController.text.isEmpty,
            ),
             SizedBox(height: 10),
            if (errMessage != null) ...[
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  errMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            ),
          ],
          SizedBox(height: 10),
            CustomButton(
              text: 'Log in',
              boxColor: Color(0xFF0865FE),
              textColor: Colors.white,
              onTap: validateAndProceed,
            ),
            const SizedBox(height: 230),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, NamePage.id);
              },
              text: 'Create an account',
              boxColor: Color(kprimaryColor),
              textColor: Color(0xFF0865FE),
            ),
          ],
        ),
      ),
    );
  }
}
