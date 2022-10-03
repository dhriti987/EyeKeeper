import 'package:dio/dio.dart';
import 'package:eye_keeper/models/student.dart';
import 'package:eye_keeper/widgets/filter_header.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/api.dart';

class DisplayStudent extends StatefulWidget {
  const DisplayStudent({super.key});

  @override
  State<DisplayStudent> createState() => _DisplayStudentState();
}

class _DisplayStudentState extends State<DisplayStudent> {
  var row = <DataRow>[];

  Future<List<Student>> fetchData() async {
    final pref = await SharedPreferences.getInstance();
    api.options.headers['Authorization'] = "Token ${pref.getString("token")}";
    var response = await api.get('school/student/');
    return Student.listFromJson(response.data);
  }

  void setDataTable() async {
    try {
      List<Student> datas = await fetchData();
      for (Student data in datas) {
        row.add(DataRow(
          onSelectChanged: (value) {
            Navigator.pushNamed(context, '/student-details');
          },
          cells: [
            DataCell(Text(data.id)),
            DataCell(Text(data.name)),
            DataCell(Text(data.className.className)),
            DataCell(Text(data.email)),
          ],
        ));
      }
      setState(() {});
    } on DioError catch (_) {}
  }

  @override
  void initState() {
    setDataTable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Students'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            BuildFilterHeader(
              title: "Student's Data",
              filterFunction: () {},
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: DataTable(
                showCheckboxColumn: false,
                border: TableBorder.all(),
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'ID',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Student Name',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Class',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Email',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
                rows: <DataRow>[...row],
              ),
            )
          ],
        ),
      ),
    );
  }
}
