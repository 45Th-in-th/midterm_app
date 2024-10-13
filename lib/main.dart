// main.dart
//commit for midterm
import 'package:flutter/material.dart';
import 'package:midterm_app/pages/00-loginpage.dart';
import 'package:midterm_app/pages/01-homepage.dart';
import 'package:midterm_app/pages/02-profilepage.dart';
import 'package:midterm_app/pages/03-timeattendanc.dart';
import 'package:midterm_app/pages/04-leaverequest.dart';
import 'package:midterm_app/pages/05-approvalpage.dart';
import 'package:midterm_app/pages/06-employeereport.dart';
import 'package:midterm_app/pages/07-employeeevalpage.dart';
import 'package:midterm_app/component/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => EmployeeProvider()), // เพิ่ม EmployeeProvider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/0',
      routes: {
        '/0': (context) => LoginPage(),
        '/1': (context) => HomePage(),
        '/2': (context) => ProfilePage(),
        '/3': (context) => TimeAttendancePage(),
        '/4': (context) => LeaveRequestPage(),
        '/5': (context) => ApprovalPage(),
        '/6': (context) => EmployeeReportPage(),
        '/7': (context) => EmployeeEvalPage(),
      },
    );
  }
}
