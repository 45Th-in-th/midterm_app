// pages/00-loginpage.dart
//commit for midterm
import 'package:flutter/material.dart';
import 'package:midterm_app/pages/02-profilepage.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/component/employee.dart';
import 'package:midterm_app/component/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  String? _username;
  String? _password;
  bool _obscurePassword = true; // ตัวแปรควบคุมการแสดงรหัสผ่าน
  int _usernameLength = 0; // ความยาวของชื่อผู้ใช้
  Employee? _loggedInEmployee;

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณาใส่ชื่อผู้ใช้';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณาใส่รหัสผ่าน';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // ดึงข้อมูลจาก EmployeeProvider
      final employeeProvider = context.read<EmployeeProvider>();

      Employee? employee;
      try {
        employee = employees.firstWhere(
          (emp) => emp.nickName == _username && emp.password == _password,
        );
      } catch (e) {
        employee = null; // ถ้าไม่พบพนักงานให้กำหนดเป็น null
      }

      if (employee != null) {
        employeeProvider
            .selectEmployee(employee); // บันทึกข้อมูลพนักงานลงใน Provider

        // นำทางไปยังหน้า ProfilePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final employee = Provider.of<EmployeeProvider>(context).selectedEmployee;
    return Scaffold(
      appBar: AppBar(
        title: Text('กรุณาเข้าระบบ เพื่อใช้งาน'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // จัดให้อยู่ด้านบนของหน้าจอ
            crossAxisAlignment:
                CrossAxisAlignment.start, // จัดการจัดแนวนอนให้อยู่ทางซ้าย
            children: [
              SizedBox(height: 40.0), // เพิ่มช่องว่างที่ด้านบน
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _usernameController, // กำหนด controller
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          icon: const Icon(Icons.person), // ไอคอนรูปคน
                          hintText: 'UserName',
                          labelText: 'UserName',
                          suffixText:
                              '$_usernameLength', // แสดงความยาวของ username
                        ),
                        validator: _validateUsername,
                        onSaved: (newValue) => _username = newValue,
                        onChanged: (value) {
                          setState(() {
                            _usernameLength =
                                value.length; // อัปเดตความยาวของ username
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          icon: const Icon(Icons.lock), // ไอคอนรูปกุญแจ
                          hintText: 'Enter your Password',
                          labelText: 'Password',
                          suffixIcon: GestureDetector(
                            onLongPress: () {
                              setState(() {
                                _obscurePassword =
                                    false; // แสดงรหัสผ่านเมื่อกดค้าง
                              });
                            },
                            onLongPressUp: () {
                              setState(() {
                                _obscurePassword =
                                    true; // ซ่อนรหัสผ่านเมื่อปล่อยปุ่ม
                              });
                            },
                            child: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility, // ไอคอนแสดง/ซ่อนรหัสผ่าน
                            ),
                          ),
                        ),
                        validator: _validatePassword,
                        onSaved: (newValue) => _password = newValue,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _login,
                      child: Text('เข้าสู่ระบบ'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(192, 41, 56, 85),
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
