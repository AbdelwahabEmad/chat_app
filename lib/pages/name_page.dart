import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class NamePage extends StatefulWidget {
  NamePage({super.key});

  static const String id = 'name_page';

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  String? errMessage;
  void validateAndProceed() {
    setState(() {
      if (firstNameController.text.isEmpty && surnameController.text.isEmpty) {
        errMessage = 'Please enter your first name and surname';
      } else if (firstNameController.text.isEmpty) {
        errMessage = 'Please enter your first name';
      } else if (surnameController.text.isEmpty) {
        errMessage = 'Please enter your surname';
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
              "What's your name?",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Enter the name you use in real life.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          CustomTextField(
            hintText: 'First name',
            controller: firstNameController,
            hasError: errMessage != null && firstNameController.text.isEmpty,
          ),
          SizedBox(height: 10),
          CustomTextField(
            hintText: 'Surname',
            controller: surnameController,
            hasError: errMessage != null && surnameController.text.isEmpty,
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
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}
