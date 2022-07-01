import 'package:flutter/material.dart';

class RecentRegistrationWidget extends StatelessWidget {
  const RecentRegistrationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Recent Registrations",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}