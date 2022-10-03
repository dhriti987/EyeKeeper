import 'package:dio/dio.dart';
import 'package:eye_keeper/models/class.dart';
import 'package:eye_keeper/providers/api.dart';
import 'package:eye_keeper/utilities/input_validators.dart';
import 'package:eye_keeper/widgets/alert_dialogs.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/form_fields.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  Future<List<Class>> fetchData() async {
    var pref = await SharedPreferences.getInstance();
    var response = await api.get('school/class/',
        options: Options(
          headers: {"Authorization": "Token ${pref.getString('token')}"},
        ));
    return Class.listFromJson(response.data);
  }

  String? selectedValue;
  String? imagePath;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _id = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Add Student'),
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
                buildImagePicker(),
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
                  text: 'Email',
                  icon: null,
                  obscureText: false,
                  textController: _email,
                  validator: ((value) {
                    return emailValidator(value);
                  }),
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
                  text: 'Address',
                  icon: null,
                  obscureText: false,
                  textController: _address,
                  validator: (value) {
                    return isNotEmptyValidator(value);
                  },
                ),
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
                      if (_formKey.currentState?.validate() ?? false) {
                        if (imagePath == null) {
                          showAlertDialog(context, "Image Not Selected",
                              "Please Select an Image for Student");
                        } else {
                          sendStudentData();
                        }
                      }
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

  Row buildImagePicker() {
    return Row(
      children: [
        Expanded(
          child: Text(
            imagePath ?? "No Image Selected",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        ElevatedButton(
            onPressed: (() async {
              FilePickerResult? result =
                  await FilePicker.platform.pickFiles(type: FileType.image);

              if (result != null) {
                setState(() {
                  imagePath = result.files.single.path;
                });
              }
            }),
            child: const Text("Select Image"))
      ],
    );
  }

  void sendStudentData() async {
    var data = {
      "id": _id.value.text,
      "name": _fullname.value.text,
      "email": _email.value.text,
      "contact": _contact.value.text,
      "_class": selectedValue,
      "photo": await MultipartFile.fromFile(imagePath!),
      "address": _address.value.text
    };

    var formData = FormData.fromMap(data);

    final pref = await SharedPreferences.getInstance();
    api.options.headers['Authorization'] = "Token ${pref.getString("token")}";

    try {
      await api.post("school/student/", data: formData);
      if (!mounted) return;
      showAlertDialog(
          context,
          "Successfully Added Student data of ${_fullname.value.text}",
          "Succesfull");
    } on DioError catch (e) {
      if (!mounted) return;
      showAlertDialog(context, e.response?.data.toString(), "Error");
    }
  }
}
