import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eye_keeper/utilities/input_validators.dart';
import 'package:eye_keeper/widgets/form_fields.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:eye_keeper/models/class.dart';
import 'package:eye_keeper/providers/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({super.key});

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  Future<List<Class>> fetchData() async {
    var pref = await SharedPreferences.getInstance();
    var response = await api.get('school/class/',
        options: Options(
          headers: {"Authorization": "Token ${pref.getString('token')}"},
        ));
    return Class.listFromJson(response.data);
  }

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _id = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _designation = TextEditingController();

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
          key: _formKey,
          child: SizedBox(
            width: 500,
            child: ListView(
              shrinkWrap: true,
              children: [
                MyTextField(
                  text: 'ID',
                  icon: null,
                  obscureText: false,
                  textController: _id,
                  validator: (value) {
                    return idValidator(value);
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                  text: 'Full Name',
                  icon: null,
                  obscureText: false,
                  textController: _fullname,
                  validator: (value) {
                    return isNotEmptyValidator(value);
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                  text: 'Email',
                  icon: null,
                  obscureText: false,
                  textController: _email,
                  validator: (value) {
                    return emailValidator(value);
                  },
                ),
                const SizedBox(height: 10),
                FutureBuilder<List<Class>>(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField2(
                            validator: (value) {
                              return isNotEmptyValidator(value);
                            },
                            hint: Text(
                              'Select Class',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: snapshot.data
                                ?.map((item) => DropdownMenuItem<String>(
                                      value: item.id.toString(),
                                      child: Text(
                                        item.className,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            buttonHeight: 40,
                            buttonWidth: 140,
                            itemHeight: 40,
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    }),
                MyTextField(
                  text: 'Contact',
                  icon: null,
                  obscureText: false,
                  textController: _contact,
                  validator: (value) {
                    return mobileValidator(value);
                  },
                ),
                const SizedBox(height: 10),
                MyTextField(
                    text: 'Designation',
                    icon: null,
                    obscureText: false,
                    textController: _designation,
                    validator: (value) {
                      return isNotEmptyValidator(value);
                    }),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 18),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      _formKey.currentState?.validate();
                    },
                    child: const Text('Submit'),
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
