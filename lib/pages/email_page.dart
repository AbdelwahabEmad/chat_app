import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  static const String id = 'email_page';
  
  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {

  final TextEditingController emailController = TextEditingController();
  String? errMessage;
  void validateAndProceed() {
    setState(() {
      if (emailController.text.isEmpty) {
        errMessage = 'Please enter your email';
      } else {
        //to next page
        errMessage = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kprimaryColor),
      appBar: AppBar(
        backgroundColor: Color(kprimaryColor),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "What's your email?",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Enter your email.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          CustomTextField(
            hintText: 'Email',
            controller: emailController,
            hasError: errMessage != null,
          ),
          SizedBox(height: 10),
            if (errMessage != null) ...[
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                errMessage!,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
          ],
          SizedBox(height: 10),
          CustomButton(
            text: 'Next',
            boxColor: Color(0xFF0865FE),
            textColor: Colors.white,
            onTap: validateAndProceed,
          ),  
          Spacer(),
          CustomButton(
            text: 'already have account',
            boxColor: Color(kprimaryColor),
            textColor: Color(0xFF0865FE),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginPage.id,
                (route) => false,
              );
            },
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}