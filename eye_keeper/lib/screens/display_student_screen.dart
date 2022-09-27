import 'package:flutter/material.dart';

class DisplayStudent extends StatefulWidget {
  const DisplayStudent({super.key});

  @override
  State<DisplayStudent> createState() => _DisplayStudentState();
}

class _DisplayStudentState extends State<DisplayStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Student\'s'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            BuildFilterHeader(
              title: "Add Student's Data",
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
                        )),
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
                          "Email",
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

class BuildFilterHeader extends StatelessWidget {
  const BuildFilterHeader({
    Key? key,
    required this.title,
    required this.filterFunction,
  }) : super(key: key);

  final String title;
  final Function filterFunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        ElevatedButton(
          onPressed: () => filterFunction(),
          child: Row(
            children: const [Icon(Icons.filter_list), Text('Filter')],
          ),
        )
      ],
    );
  }
}
