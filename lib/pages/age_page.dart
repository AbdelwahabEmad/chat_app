import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/gender_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  static const String id = 'date_page';

  @override
  State<AgePage> createState() => _BirthDatePageState();
}

class _BirthDatePageState extends State<AgePage> {

  final TextEditingController ageController = TextEditingController();
  String? errMessage;
  void validateAndProceed() {
    setState(() {
      if (ageController.text.isEmpty) {
        errMessage = 'Please enter your age';
      } else {
        //to next page
        errMessage = null;
        Navigator.pushNamed(context, GenderPage.id);
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
              "How old are you?",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Enter your age.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          CustomTextField(
            hintText: 'Age',
            controller: ageController,
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
