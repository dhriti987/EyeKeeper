import 'package:dio/dio.dart';
import 'package:eye_keeper/providers/api.dart';
import 'package:eye_keeper/utilities/input_validators.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/form_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                margin: const EdgeInsets.only(top: 50),
                child: MyTextField(
                    text: "Email",
                    obscureText: false,
                    icon: Icons.mail_outline_rounded,
                    textController: _email,
                    validator: (value) {
                      return emailValidator(value);
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                child: MyTextField(
                  text: "PASSWORD",
                  obscureText: true,
                  icon: Icons.lock_outline_rounded,
                  textController: _password,
                  validator: ((value) {
                    return passwordValidator(value);
                  }),
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
                  onPressed: () async {
                    try {
                      var response = await api.post('auth/token/', data: {
                        "username": _email.value.text,
                        "password": _password.value.text,
                      });
                      final pref = await SharedPreferences.getInstance();
                      await pref.setString("token", response.data['token']);
                      await pref.setString("name", response.data['name']);
                      await pref.setInt("userId", response.data['user_id']);
                      await pref.setInt("class", response.data['class']);
                      if (!mounted) return;
                      Navigator.pushReplacementNamed(context, '/home');
                    } on DioError catch (e) {
                      showError(context, e);
                    }
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

  Future<dynamic> showError(BuildContext context, DioError e) {
    return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: const Text("Login Failed"),
            content: Text(e.response?.data['non_field_errors'][0]),
            actions: [
              TextButton(
                onPressed: (() => Navigator.pop(context)),
                child: const Text("Ok"),
              )
            ],
          )),
    );
  }
}
