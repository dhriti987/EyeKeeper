import 'package:eye_keeper/widgets/filter_header.dart';
import 'package:flutter/material.dart';

class DisplayAttendance extends StatefulWidget {
  const DisplayAttendance({super.key});

  @override
  State<DisplayAttendance> createState() => _DisplayAttendanceState();
}

class _DisplayAttendanceState extends State<DisplayAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Attendance',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            BuildFilterHeader(
              title: "",
              filterFunction: () {},
            ),
            SizedBox(
              height: 30,
            ),
            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(1)
              },
              children: [
                const TableRow(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Student Name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Class",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Attendance",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
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
