import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/responsive.dart';
import 'Doctor_Main_Page.dart';
import 'Forget_Password.dart';
import 'MainPage.dart';
import 'UserSignup.dart';
import 'admin.dart';
import 'doctor_login.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class UserLogin extends StatefulWidget {
  int unit = 0;
  List products = [];

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  getData() async {
    var url = Uri.parse("http://localhost/PhpProject1/SignIn.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        widget.products = json.decode(response.body);
      });
    }
    print(widget.products);
    print("above me");
    return widget.products;
  }

  List products2 = [];

  getDataDoctors() async {
    var url = Uri.parse("http://localhost/PhpProject1/Doctors_SingIn.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        products2 = json.decode(response.body);
      });
    }
    print(products2);
    print("above me");
    return products2;
  }

  @override
  void initState() {
    super.initState();
    getData();
    getDataDoctors();
  }

  String error_message = "";

  void _goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserSignup()),
    );
  }

  void _goToForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgetPassword()),
    );
  }

  bool met() {
    for (int i = 0; i < widget.products.length; i++) {
      if (widget.products[i]["email"] == nameController.text) {
        if (widget.products[i]["password"] == _passwordController.text) {
          setState(() {
            widget.unit = i;
          });
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty || products2.isEmpty) {
      // Data is still being fetched, display a loading indicator
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      // Data is available, build the login screen
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          backgroundColor: Colors.black,
          title: Container(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  height: 100,
                  width: 100,
                  child: Image.asset("icons/Logo-modified.png"),
                ),
                const Text(
                  'Specialization zone',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          bottom: ResponsiveWidget.isSmallScreen(context)
              ? PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Column(
              children: [],
            ),
          )
              : PreferredSize(child: SizedBox(), preferredSize: Size(0, 0)),
        ),
        body: Center(
          child: Container(
            height: 400,
            width: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  onChanged: (text) {
                    setState(() {
                      error_message = "";
                    });
                  },
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  onChanged: (text) {
                    setState(() {
                      error_message = "";
                    });
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String name = nameController.text;
                    String password = _passwordController.text;
                    if (nameController.text == "admin" &&
                        password == "admin1") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminPage()));
                    }
                    for (int i = 0; i < products2.length; i++) {
                      if (products2[i]["name"] == name) {
                        if (products2[i]["password"] == password) {
                          print(products2[i]["idDoctors"].toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => D_Main(
                                      name: name,
                                      id: products2[i]["idDoctors"])));
                        }
                      }
                    }
                    if (met()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPage(
                              products: widget.products,
                              unit: widget.unit,
                            )),
                      );
                    } else {
                      setState(() {
                        error_message = "Incorrect inquiries";
                      });
                    }
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: _goToSignUp,
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.green),
                ),
                TextButton(
                  onPressed: _goToForgotPassword,
                  child: Text('Forgot Password'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.green),
                ),
                Text(error_message, style: TextStyle(color: Colors.red))
              ],
            ),
          ),
        ),
      );
    }
  }
}