import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/age_page.dart';
import 'package:chat_app/pages/create_account_page.dart';
import 'package:chat_app/pages/email_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/name_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // Define the routes for the application
        LoginPage.id: (context) => LoginPage(),
        CreateAccountPage.id: (context) => CreateAccountPage(),
        NamePage.id: (context) => NamePage(),
        AgePage.id: (context) => AgePage(),
        EmailPage.id: (context) => EmailPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
