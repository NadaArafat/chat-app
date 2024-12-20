import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text,required this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
