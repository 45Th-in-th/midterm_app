// pages/06-employeereport.dart
//commit for midterm
import 'package:flutter/material.dart';
import 'package:midterm_app/component/provider.dart';
import 'package:provider/provider.dart';

class EmployeeReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final employee = Provider.of<EmployeeProvider>(context).selectedEmployee;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Employee Report: (${employee?.firstName ?? 'ยังไม่ได้ login'})'),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              Navigator.pushNamed(context, '/7');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('This is Approval Page'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(192, 41, 56, 85), // You can customize the color
        shape: CircularNotchedRectangle(), // Adds a notch for the FAB
        notchMargin: 5.0, // Adds margin around the notch
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Space the icons evenly
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.summarize),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/5');
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              iconSize: 45,
              color: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/1');
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/0');
              },
            ),
          ],
        ),
      ),
    );
  }
}
