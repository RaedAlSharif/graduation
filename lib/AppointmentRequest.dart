import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'admin.dart';
class AppointmentRequest extends StatefulWidget {
  AppointmentRequest({Key? key}) : super(key: key);

  @override
  _AppointmentRequestState createState() => _AppointmentRequestState();
}

class _AppointmentRequestState extends State<AppointmentRequest> {

  final NAME = TextEditingController();
  final SURNAME = TextEditingController();
  final AGE = TextEditingController();
  final EMAIL = TextEditingController();
  final PHONE = TextEditingController();
  final GENDER = TextEditingController();
  //final DATE = TextEditingController();
 // final TIME = TextEditingController();
  final NOTE = TextEditingController();

  String str = "";
 // static List products = [];
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future send(BuildContext cont) async{

    var url = await (Uri.parse("http://localhost/PhpProject1/index.php")
    );
    var response = await http.post(url , body: {
    "NAME" : NAME.text,
    "SURNAME" : SURNAME.text,
    "AGE" : AGE.text,
   "EMAIL" : EMAIL.text,
    "PHONE" : PHONE.text,
    "GENDER" : GENDER.text,
  /*  "DATE" : DATE.text,
   "TIME" : TIME.text*/
      "DATE": selectedDate != null ? selectedDate.toString() : '',
      "TIME": selectedTime != null ? selectedTime.toString().substring(10,15) : '',
    });
    var data = json.decode(response.body);
    print(data);
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    //print(selectedTime != null ? selectedTime.toString().substring(10 , 15) : '');
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40.0),
                Text(
                  'MAKE AN APPOINTMENT',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.0),
                SizedBox(
                  height: 50,
                  width: 270,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Name"),
                      hintText: "Please write your username",
                    ),
                    controller: NAME,
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 50,
                  width: 270,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Surname"),
                      hintText: "Please write your username",
                    ),
                    controller: SURNAME,
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 50,
                  width: 270,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Age"),
                      hintText: "Please write your username",
                    ),
                    controller: AGE,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 50,
                  width: 270,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Email address"),
                      hintText: "Please write your username",
                    ),
                    controller: EMAIL,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 50,
                  width: 270,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Phone number"),
                      hintText: "Please write your username",
                    ),
                   keyboardType: TextInputType.number,
                    controller: PHONE,
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 50,
                  width: 270,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Gender"),
                      hintText: "Please write your username",
                    ),
                    controller: GENDER,
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 50,
                  width: 270,
                  child: ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(selectedDate != null
                        ? 'Date: ${selectedDate!.toString().substring(0, 10)}'
                        : 'Select Date'),
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 50,
                  width: 270,
                  child: ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text(selectedTime != null
                        ? 'Time: ${selectedTime!.format(context)}'
                        : 'Select Time'),
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 300,
                  width: 800,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Note"),
                      hintText: "Describe your condition",
                    ),
                    controller: NOTE,
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    if (NAME.text == "adminco12") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => admin()),
                      );
                    } else {

                      if (NAME.text.isNotEmpty || SURNAME.text.isNotEmpty || PHONE.text.isNotEmpty ||
                          EMAIL.text.isNotEmpty || GENDER.text.isNotEmpty ||  AGE.text.isNotEmpty){

                        String email = EMAIL.text;
                      final bool e = EmailValidator.validate(email);
                      if (e){
                        final String time = selectedTime != null ? selectedTime.toString() : '';
                       
                        print(time.replaceAll("TimeOfDay()", ""));

                         send(context);

                        final url = Uri.parse(
                            'https://api.emailjs.com/api/v1.0/email/send');
                        final response = await http.post(
                          url,
                          headers: {'Content-Type': 'application/json'},
                          body: json.encode(
                            {
                              'service_id': 'service_sbp0sc2',
                              'template_id': 'template_xbij89i',
                              'user_id': 'DR9oYPKTWE1s9l-w9',
                              'template_params': {
                                'name': NAME.text,
                                'surname': SURNAME.text,
                                'phone': PHONE.text,
                                'age': AGE.text,
                                'gender': GENDER.text,
                                'date': selectedDate != null ? selectedDate!.toString().substring(0, 10) : '',
                                'time': selectedTime != null ? selectedTime!.toString().substring(10,15) : '',
                                'note': NOTE.text,
                              },
                            },
                          ),
                        );
                      }
                      else{
                        setState(() {
                          str = "Invalid Email-Address";
                        });
                      }
                    }
                      else{
                        setState(() {
                          str = "Please fill all the information";
                        });
                      }
                    }
                  },
                  child: const Text(
                    'Submit',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 25,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ),
                Text(str , style: TextStyle(color: Colors.red),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
