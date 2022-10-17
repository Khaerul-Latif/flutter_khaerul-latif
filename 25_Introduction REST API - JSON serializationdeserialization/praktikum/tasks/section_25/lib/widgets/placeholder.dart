import 'package:flutter/material.dart';

class PlaceHolderUser extends StatelessWidget {
  final String name;
  final String job;
  final String dateNow;
  final String dateTitle;

  const PlaceHolderUser(
      {super.key,
      required this.name,
      required this.job,
      required this.dateNow,
      required this.dateTitle});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Name : $name',
            style: const TextStyle(
              fontWeight : FontWeight.bold,
            ),
          ),
          Text(
            'Job : $job',
            style: const TextStyle(
              fontWeight : FontWeight.bold,
            ),
          ),
          Text(
            '$dateTitle : $dateNow',
            style: const TextStyle(
              fontWeight : FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}