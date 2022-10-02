import 'package:flutter/material.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Student\'s profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Edit",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKCHJAV9KaGLLAN4dD9VV-XHFKa37zELZFsg&usqp=CAU'),
            Text(
              "Dhritiman Bharadwaj",
              style: TextStyle(fontSize: 80),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Student Id\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              )),
                          TextSpan(
                            text: '12345',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          )
                        ]),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Contact No.\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              )),
                          TextSpan(
                            text: '1234567890',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          )
                        ]),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Email\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              )),
                          TextSpan(
                            text: 'dummyemail@mail.com',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Class\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              )),
                          TextSpan(
                            text: '1 A',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          )
                        ]),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Admission Date\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              )),
                          TextSpan(
                            text: '12345',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          )
                        ]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
                            style: TextStyle(fontSize: 24),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
