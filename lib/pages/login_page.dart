import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Color(0xFF0C151A),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Color(0xFF0865FE),
            child: const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(child: Text('Chat App', style: TextStyle(fontSize: 24),)),
            ),
          ),
          const SizedBox(height: 100,),
          CustomTextField(hintText: 'email address',),
          const SizedBox(height: 10,),
          CustomTextField(hintText: 'password',),
          const SizedBox(height: 20,),
          CustomButton(text: 'Log in', boxColor: Color(0xFF0865FE), textColor: Colors.white,),
          const SizedBox(height: 250,),
          CustomButton(text: 'Create an account', boxColor: Color(0xFF0C151A), textColor: Color(0xFF0865FE),),
        ],
      ),
     );
  }
}