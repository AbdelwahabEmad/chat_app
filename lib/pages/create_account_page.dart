import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  static const String id = 'create_account_page';
  String? email, password;
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
            CustomTextField(
              onChanged: (data) {
                email = data;
              },
              hintText: 'email address',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              onChanged: (data) {
                password = data;
              },
              hintText: 'password',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () async {
                try {
                  UserCredential user = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                } on FirebaseAuthException catch (e) {
                  //to show error messages
                if(e.code == 'weak-password'){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('The password provided is too weak.')),
                  );
                } else if (e.code == 'email-already-in-use'){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('The account already exists for that email.')),
                  );
                }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('email created')),
                  );
                } 
              },
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
