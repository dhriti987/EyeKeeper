import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return const SizedBox(
      height: 30,
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Wrap(
      runSpacing: 8.0,
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        ExpansionTile(
          leading: const Icon(Icons.home),
          title: const Text('Add Data'),
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Add Teacher'),
              onTap: () {
                Navigator.pushNamed(context, '/add-teacher');
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Add Student'),
              onTap: () {
                Navigator.pushNamed(context, '/add-student');
              },
            ),
          ],
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {},
        ),
      ],
    );
  }
}
