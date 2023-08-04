import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project/responsive.dart';
import 'package:http/http.dart' as http;

import 'admin.dart';
class AppointmentRequest extends StatefulWidget {
  List products2;
  int unit;
  AppointmentRequest({Key? key , required this.products2 , required this.unit}) : super(key: key);

  @override
  _AppointmentRequestState createState() => _AppointmentRequestState(products2 , unit);
}

class _AppointmentRequestState extends State<AppointmentRequest> {
  List products2;
  int unit;
  _AppointmentRequestState(this.products2 , this.unit);

  List products = [];

  bool reserved = false;
  getData() async {
    var url = await (Uri.parse("http://localhost/PhpProject1/getData.php"));
    var response = await http.get(url);
    if ( response.statusCode == 200){
      setState(() {
        products = json.decode(response.body);
      });
    }
    print(products);
    print("above me");
    return products;
  }
  List products3 = [];
  getData_reserved() async {
    var url = await (Uri.parse("http://localhost/PhpProject1/get_reserved.php"));
    var response = await http.get(url);
    if ( response.statusCode == 200){
      setState(() {
        products3 = json.decode(response.body);
      });
    }
    print(products3);
    print("above me");
    return products3;
  }
  @override
  void initState() {
    super.initState();
    getData();
    getData_reserved();
    //newp = getData();
  }
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

  String id_patient = "";
  String id_reserved = "";

  Future send(BuildContext cont) async{
String age = products2[unit]["age"].toString();
    var url = await (Uri.parse("http://localhost/PhpProject1/index.php")
    );
    var response = await http.post(url , body: {
    "NAME" : products2[unit]["name"],
    "SURNAME" : products2[unit]["surname"],
    "AGE" : age,
   "EMAIL" : products2[unit]["email"],
    "PHONE" : products2[unit]["phone"],
    "GENDER" : products2[unit]["gender"],
  /*  "DATE" : DATE.text,
   "TIME" : TIME.text*/
      "DATE": selectedDate != null ? selectedDate.toString() : '',
      "TIME": selectedTime != null ? selectedTime.toString().substring(10,15) : '',
      "IDDOCTORS": products2[unit]["idDoctors"].toString()
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
                    color: Colors.indigo,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                /*SizedBox(height: 40.0),
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
                ),*/
                const Text("Working days (Saturday-Thursday) \n Working Time (08:00 AM - 04:30 PM)"),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 50,
                  width: 270,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, foregroundColor: Colors.white),
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, foregroundColor: Colors.white),
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
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, foregroundColor: Colors.white),
                  onPressed: () async {
                   /* else {

                      if (NAME.text.isNotEmpty || SURNAME.text.isNotEmpty || PHONE.text.isNotEmpty ||
                          EMAIL.text.isNotEmpty || GENDER.text.isNotEmpty ||  AGE.text.isNotEmpty){

                        String email = EMAIL.text;
                      final bool e = EmailValidator.validate(email);
                      if (e) {*/
                        if ((selectedTime != null ? selectedTime!.toString().substring(13, 15) : '') == "00" ||
                            (selectedTime != null ? selectedTime!.toString().substring(13, 15) : '') == "30"){
                          if(is_reserved_Schedule()) {
                              if (!is_reserved()) {
                                Success();
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
                                        'name': products2[unit]["name"],
                                        'surname': products2[unit]["surname"],
                                        'phone': products2[unit]["phone"],
                                        'age': products2[unit]["age"],
                                        'gender': products2[unit]["gender"],
                                        'date': selectedDate != null
                                            ? selectedDate!
                                            .toString().substring(0, 10)
                                            : '',
                                        'time': selectedTime != null
                                            ? selectedTime!
                                            .toString().substring(10, 15)
                                            : '',
                                        'note': NOTE.text,
                                      },
                                    },
                                  ),
                                );
                              }
                             else {
                              setState(() {
                                str =
                                "There is already an appointment at this time please choose another Date or Time";
                              });
                            }
                          }
                          else{
                            setState(() {
                              str =
                              "The Doctor is not available at this time and date";
                            });
                          }
                        }
                        else{
                          setState(() {
                            str = "Time in minutes must be in (00) or (30) states. (12:00) or (12:30)";
                          });
                        }
                      },
                     /*/ else{
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
                  },*/
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
  bool is_reserved(){
    for (int i = 0; i < products.length; i++) {

      print(products[i]['time'].toString().substring(0,5));
      print( (selectedTime != null ? selectedTime!.toString()
          .substring(10, 15) : ''));
      if (products[i]['time'].substring(0,5) ==
                              (selectedTime != null ? selectedTime!.toString()
                                  .substring(10, 15) : '') &&
      products[i]['date'] == (selectedDate != null ? selectedDate
          .toString().substring(0,10) : '')) {
          return true;
      }
    }
    return false;
  }

  bool is_reserved_Schedule() {
    String selectedTimeStr = selectedTime != null
        ? selectedTime!.toString().substring(10, 15)
        : '';

    String selectedDateStr = selectedDate != null
        ? selectedDate.toString().substring(0, 10)
        : '';

    for (int i = 0; i < products3.length; i++) {
      String scheduleTimeStr = products3[i]['Time'].toString().substring(0, 5);
      String scheduleDateStr = products3[i]['Date'].toString();

      if (products2[unit]["idDoctors"] == products3[i]["idDoctors"]) {
        if (scheduleTimeStr == selectedTimeStr && scheduleDateStr == selectedDateStr) {
          return false;
        }
      }
    }
    return true;
  }



  Future Success() => showDialog(
    context: context,
    builder: (context) => const AlertDialog(
      backgroundColor: Colors.black45,
      title: Text("Appointment requested successfully",
        style: TextStyle(color: Colors.yellowAccent)
        ),
      content:Text("You will be contacted shortly about the status of your request!" + "\n"
          "Thank you for choosing Specialization zone", style: TextStyle(color: Colors.white)),

      ),
    );
}
