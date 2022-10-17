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
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            'Job : $job',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            '$dateTitle : $dateNow',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}