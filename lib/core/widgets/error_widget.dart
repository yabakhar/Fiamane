import 'package:flutter/material.dart';

class ErrorWidgets extends StatelessWidget {
  ErrorWidgets({super.key, required this.errorText});
  String errorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          errorText,
          style: const TextStyle(fontSize: 27),
        ),
      ),
    );
  }
}
