import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.inputText,
    required this.suffixIcon,
    required this.controller,
  });

  final String inputText;
  final Icon suffixIcon;
  final TextEditingController controller;

  final Color inputColor = const Color.fromRGBO(196, 196, 196, 0.2);
  final Color inputTextColor = const Color.fromRGBO(0, 0, 0, 0.5);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: ShapeDecoration(
          color: inputColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            hintText: inputText,
            hintStyle: TextStyle(
                color: inputTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w300)),
      ),
    );
  }
}
