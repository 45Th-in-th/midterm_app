// component/namecard.dart
// Midterm for weekebd
import 'package:flutter/material.dart';

class NameCardData {
  const NameCardData({
    required this.empId,
    required this.firstName,
    required this.familyName,
    required this.position,
    required this.department,
    required this.nickName,
    required this.imagePath,
    required this.imageUrl,
  });
  final String empId;
  final String firstName;
  final String familyName;
  final String position;
  final String department;
  final String nickName;
  final String imagePath;
  final String imageUrl;
}

class NameCard extends StatefulWidget {
  const NameCard({
    super.key,
    required this.data,
  });
  final NameCardData data;

  @override
  State<NameCard> createState() => _NameCardState();
}

class _NameCardState extends State<NameCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120.0,
            child: Image.asset(widget.data.imageUrl),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${widget.data.firstName}'),
              Text('Surname: ${widget.data.familyName}'),
              Text('Position: ${widget.data.position}'),
              Text('Department: ${widget.data.department}'),
            ],
          ),
        ],
      ),
    );
  }
}
