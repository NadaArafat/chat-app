import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../services/auth_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static const String id = "signup_page";

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? email;
  String? password;
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool obscure = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: const CircularProgressIndicator(
          color: Colors.blueAccent,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Image.asset("assets/images/scholar.png"),
                  const Text(
                    "Scholar chat",
                    style: TextStyle(
                        fontFamily: "Pacifico", fontSize: 32, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    hint: "Email",
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    hint: 'Password',
                    obscureText: obscure,
                    obscureIcon: IconButton(onPressed: (){
                      setState(() {
                        obscure = !obscure;
                      });
                    }, icon: const Icon(Icons.remove_red_eye,color: Colors.white,),),
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                      text: "Sign Up",
                      onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            String message = await signup(email!, password!);
                            setState(() {
                              isLoading = false;
                            });
                            showSnackBar(message);
                            if(message=='Account is created successfully!'){
                              navigate();
                            }
                          }
                      }),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Login",
                            style: TextStyle(color: Color(0xffC7EDE6))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }
  void navigate() {
    Navigator.pushNamed(context, ChatPage.id,arguments: email);
  }
}
