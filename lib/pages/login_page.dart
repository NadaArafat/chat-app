import 'package:chat_app/pages/signup_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_field.dart';
import 'chat_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String id = "login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isLoading = false;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: Colors.blueAccent,
        ),
        inAsyncCall: isLoading,
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
                        fontFamily: "Pacifico",
                        fontSize: 32,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Login",
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
                    obscureIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                      text: "Login",
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          String message = await login(email!, password!);
                          setState(() {
                            isLoading = false;
                          });
                          showSnackBar(message);
                          if (message ==
                              'Logged in successfully,Welcome Back!') {
                            navigate();
                          }
                        }
                      }),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignupPage.id);
                        },
                        child: const Text("Sign up",
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
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void navigate() {
    Navigator.pushNamed(context, ChatPage.id, arguments: email);
  }
}
