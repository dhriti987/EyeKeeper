import 'package:flutter/material.dart';

Future<dynamic> showAlertDialog(
        BuildContext context, String? alertText, String alertTitle) =>
    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(alertTitle),
            content: Text(alertText ?? "An Unknown Error has occured"),
            actions: [
              TextButton(
                onPressed: (() => Navigator.pop(context)),
                child: const Text("Ok"),
              )
            ],
          )),
    );
