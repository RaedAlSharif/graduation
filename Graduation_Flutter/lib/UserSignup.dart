import 'dart:convert';
import 'dart:html';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/responsive.dart';

import 'user_login.dart';
import 'package:http/http.dart' as http;
class UserSignup extends StatefulWidget {
  @override
  _UserSignupState createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController Mobile_phoneController = TextEditingController();
  String _selectedGender = 'Male'; // Default selected gender
  String _selectedAge = '[13-24]'; // Default selected gender
  DateTime? selectedDate;
   double size = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    Mobile_phoneController.dispose();
    super.dispose();
  }

  List products = [];
  getDataDoctors() async {
    var url = await (Uri.parse("http://localhost/PhpProject1/Doctors_SingIn.php"));
    var response = await http.get(url);
    if ( response.statusCode == 200){
      setState(() {
        products = json.decode(response.body);
      });
    }
    setState(() {
      size = products.length * 100;
    });
    print(products);
    print("above me");
    return products;

  }
  String error_message = "";
  Future send(BuildContext cont) async{
    if(_selectedAge == "[0-12]"){
      _selectedAge = "6";
    }
    else if (_selectedAge == "[13-24]"){
      _selectedAge = "18";
    }
    else if (_selectedAge == "[25-40]"){
      _selectedAge = "33";
    }
    else{
      _selectedAge = "50";
    }
    print(id.toString());
    var url = await (Uri.parse("http://localhost/PhpProject1/SignUp.php")
    );
    var response = await http.post(url , body: {
      "NAME" : _nameController.text,
      "SURNAME" : _surnameController.text,
      "AGE" : _selectedAge,
      "EMAIL" : _emailController.text,
      "PHONE" : Mobile_phoneController.text,
      "GENDER" : _selectedGender,
      /*  "DATE" : DATE.text,
   "TIME" : TIME.text*/
      "PASSWORD": _passwordController.text,
      "IDDOCTORS": id.toString()
    });
    var data = json.decode(response.body);
    print(data);
  }
  String Choosen ="";
  int id = 0;



  List products2 = [];
  getData() async {
    var url = await (Uri.parse("http://localhost/PhpProject1/SignIn.php"));
    var response = await http.get(url);
    if ( response.statusCode == 200){
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

    //newp = getData();
  }
  List<String> strs = ["","","","","","","","",""];
  @override
  Widget build(BuildContext context) {
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
              ?  PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Column(
              children: [],
            ),
          )
              : PreferredSize(child: SizedBox(), preferredSize: Size(0, 0)),
        ),
        body: SingleChildScrollView(

       child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (text) {
                setState(() {
                  error_message = "";
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _surnameController,
              decoration: const InputDecoration(
                labelText: 'Surname',
              ),
              onChanged: (text) {
                setState(() {
                  error_message = "";
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (text) {
                setState(() {
                  error_message = "";
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: Mobile_phoneController,
              decoration: const InputDecoration(
                labelText: 'Mobile phone',
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
            DropdownButtonFormField<String>(
              value: _selectedGender,
              decoration: const InputDecoration(
                labelText: 'Gender',
              ),
              items: <String>['Male', 'Female']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedAge,
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
              items: <String>['[0-12]', '[13-24]', '[25-40]', '[40+]']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAge = newValue!;
                });
              },
            ),
            SizedBox(
              height: size,
              child: Expanded(
                child: ListView.builder(
                      shrinkWrap: true,
                      itemExtent: 100,
                      itemCount: products.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          //visualDensity: VisualDensity(vertical: 6),
                          dense: false,
                          subtitle: Text(
                            "Doctors's Name: " +
                                products[i]['name'] +
                                "\n"
                                    "Speciality: " +
                                products[i]["speciality"] +
                                "\n",
                            style: TextStyle(fontStyle: FontStyle.normal),
                          ),
                          // title: Text(products[i]['date'] +" " + products[i]["time"]),
                          leading: TextButton(
                            onPressed: () async {
                              setState(() {
                                for (int j = 0; j < strs.length; j++) {
                                  strs[j] = "";
                                }
                                Choosen = "Chosen";
                                id = products[i]["idDoctors"];
                                print(id);
                                strs[i] = "Chosen";
                              });
                            },
                            child: Text("Choose"),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, foregroundColor: Colors.white),
                          ),
                          trailing: Text(strs[i]),
                        );
                      })),
                ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _surnameController.text.isNotEmpty &&
                    Mobile_phoneController.text.isNotEmpty &&
                    _emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  String email = _emailController.text;
                  final bool e = EmailValidator.validate(email);
                  if (e) {
                    if (met()) {
                      if (_passwordController.text.length > 6) {
                        if(id != 0){
                        send(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserLogin()),
                        );
                      }
                      else{
                        setState(() {
                          error_message =
                          "Please Choose a doctor";
                        });
                        }
                      }
                      else {
                        setState(() {
                          error_message =
                              "Password must be at least 7 characters";
                        });
                      }
                    } else {
                      setState(() {
                        error_message = "Email-Address already in use";
                      });
                    }
                  } else {
                    setState(() {
                      error_message = "Invalid Email-Address";
                    });
                  }
                } else {
                  setState(() {
                    error_message = "Please fill all the information";
                  });
                }
              },
              child: Text('Sign Up') ,style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, foregroundColor: Colors.white),
            ),

            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserLogin()),
                );
              },
              child: const Text(
                'Already have an account Login',
                style: TextStyle(
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Text(
              error_message,
              style: TextStyle(color: Colors.red),
            ),

          ],
        ),
      ),
    )
    );
  }
  bool met(){
    for (int i = 0; i < products2.length; i++) {
      if (products2[i]["email"] == _emailController.text) {
        return false;
      }
    }
    return true;
  }
}
