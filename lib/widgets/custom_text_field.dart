import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.hasError = false,
  });
  // to control the text inside the text field

  String hintText;
  void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool hasError;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            // intial state of border
            borderSide: BorderSide(color: hasError? Colors.red : Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            // when we click on text field
            borderSide: BorderSide(color: hasError? Colors.red : Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              // to clear the text field
              controller?.clear();
            },
            icon: const Icon(Icons.clear, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
