import 'package:flutter/material.dart';

import '../widgets/form_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Please sign in to continue',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: MyTextField(
                  text: "Email",
                  obscureText: false,
                  icon: Icons.mail_outline_rounded,
                  textController: null,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 30),
                child: MyTextField(
                  text: "PASSWORD",
                  obscureText: true,
                  icon: Icons.lock_outline_rounded,
                  textController: null,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 18),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'LOGIN ',
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
