import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  static const String id = 'create_account_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(kprimaryColor),
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
            CustomTextField(hintText: 'username'),
            const SizedBox(height: 10),
            CustomTextField(hintText: 'email address'),
            const SizedBox(height: 10),
            CustomTextField(hintText: 'password'),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Create Account',
              boxColor: Color(0xFF0865FE),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
