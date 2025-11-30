import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText});

  String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            // intial state of border
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: const OutlineInputBorder(
            // when we click on text field
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        
        ),
      ),
    );
  }
}
