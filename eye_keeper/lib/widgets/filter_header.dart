import 'package:flutter/material.dart';

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
