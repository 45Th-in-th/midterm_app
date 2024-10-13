// pages/01-homepage.dart
//commit for midterm
import 'package:flutter/material.dart';
import 'package:midterm_app/component/provider.dart';
import 'package:provider/provider.dart';

final List<String> pageTitles = [
  'Login Page', // 0
  'Home Page', // 1
  'Profile Page', // 2
  'Time Attendance Page', // 3
  'Leave Request Page', // 4
  'Approval Page', // 5
  'Employee Report Page', // 6
  'Employee Evaluation Page', // 7
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final employee = Provider.of<EmployeeProvider>(context).selectedEmployee;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page: (${employee?.firstName ?? 'ยังไม่ได้ login'})'),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Okay'),
                action: SnackBarAction(
                  label: 'Accept',
                  onPressed: () {},
                ),
              ));
            },
          ),
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              Navigator.pushNamed(context, '/2');
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(8, (index) {
          return InkWell(
            onTap: () {
              if (index == 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Homepage is already here'),
                  ),
                );
                return;
              } else if (index == 0) {
                // นำทางไปยังหน้า LoginPage
                Navigator.pushNamed(context, '/0');
                return;
              } else {
                // นำทางไปยังหน้าต่างๆ ตาม index ที่กำหนด
                Navigator.pushNamed(context, '/${index}');
              }
            },
            child: Container(
              width: 20.0,
              height: 20.0,
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: 15.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(pageTitles[index]),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
