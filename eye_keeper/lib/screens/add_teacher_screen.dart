import 'package:eye_keeper/widgets/form_fields.dart';
import 'package:flutter/material.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({super.key});

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Add Teacher'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          child: SizedBox(
            width: 500,
            child: ListView(
              shrinkWrap: true,
              children: [
                MyTextField(
                  text: 'ID',
                  icon: null,
                  obscureText: false,
                  textController: null,
                ),
                SizedBox(height: 10),
                MyTextField(
                  text: 'Full Name',
                  icon: null,
                  obscureText: false,
                  textController: null,
                ),
                SizedBox(height: 10),
                MyTextField(
                  text: 'Email',
                  icon: null,
                  obscureText: false,
                  textController: null,
                ),
                SizedBox(height: 10),
                MyTextField(
                  text: 'Contact',
                  icon: null,
                  obscureText: false,
                  textController: null,
                ),
                SizedBox(height: 10),
                MyTextField(
                  text: 'Designation',
                  icon: null,
                  obscureText: false,
                  textController: null,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 18),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
