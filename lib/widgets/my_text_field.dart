import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key, this.hint, this.onChanged,this.obscureText = false,this.obscureIcon});

  final String? hint;
  final void Function(String)? onChanged;
  final bool obscureText;
  final IconButton? obscureIcon;
  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      validator: (data){
        if(data!.isEmpty){
          return 'field is required';
        }
        return null;
      },
      onChanged: widget.onChanged,
      style: const TextStyle(color: Colors.white,),
      decoration: InputDecoration(
        suffixIcon: widget.obscureIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey,),

      ),
      cursorColor: Colors.grey,

    );
  }
}
