import 'package:eye_keeper/widgets/filter_header.dart';
import 'package:flutter/material.dart';

class DisplayTeacher extends StatefulWidget {
  const DisplayTeacher({super.key});

  @override
  State<DisplayTeacher> createState() => _DisplayTeacherState();
}

class _DisplayTeacherState extends State<DisplayTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Teachers'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            BuildFilterHeader(
              title: "Teacher's Data",
              filterFunction: () {},
            ),
            SizedBox(
              height: 30,
            ),
            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(3)
              },
              children: [
                const TableRow(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "ID",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Teacher Name",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Class",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Designation",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
