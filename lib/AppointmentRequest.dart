import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class AppointmentRequest extends StatelessWidget {
  AppointmentRequest({Key? key}) : super(key: key);

  final NAME = TextEditingController();
  final SURNAME = TextEditingController();
  final AGE = TextEditingController();
  final EMAIL = TextEditingController();
  final PHONE = TextEditingController();
  final GENDER = TextEditingController();
  final DATE = TextEditingController();
  final TIME = TextEditingController();

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
    "DATE" : DATE.text,
   "TIME" : TIME.text
    });
    var data = json.decode(response.body);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(
            body: SingleChildScrollView(

                child: SizedBox(
                  width: 1440,
                  height: 1024,
                 child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 66.83784484863281+4096,
                          left: 70.5975112915039,
                          child: Container(
                              width: 1322,
                              height: 709,
                              decoration: const BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(150),
                                  bottomRight: Radius.circular(500),
                                ),
                                color : Color.fromRGBO(119, 35, 35, 1),
                              )
                          )
                      ),
                    Positioned(
                          top: 313.4561767578125,
                          left: 1000.4446411132812,
                        child:  SizedBox(
                          height: 50,
                          width: 270,
                          child:
                          TextField(
                            decoration: const InputDecoration(label:
                            Text("Time of Session"),
                                hintText: "Please write your username"
                            ),
                            controller: TIME,
                          ),

                        ),
                      ),Positioned(
                          top: 189.45631408691406,
                          left: 1000.2686157226562,
                        child:  SizedBox(
                          height: 50,
                          width: 270,
                          child:
                          TextField(
                            decoration: const InputDecoration(label:
                            Text("Date of Session"),
                                hintText: "Please write your username"
                            ),
                            controller: DATE,
                          ),
                        ),
                      ),Positioned(
                          top: 438.05364990234375,
                          left: 579.62109375,
                        child:  SizedBox(
                          height: 50,
                          width: 270,
                          child:
                          TextField(
                            decoration: const InputDecoration(label:
                            Text("Phone number"),
                                hintText: "Please write your username"
                            ),
                            controller: PHONE,
                          ),
                        ),
                      ),Positioned(
                          top: 366.48809814453125,
                          left: 273.51922607421875,
                        child:  SizedBox(
                          height: 50,
                          width: 270,
                          child:
                          TextField(
                            decoration: const InputDecoration(label:
                            Text("E-mail-address"),
                                hintText: "Please write your username"
                            ),
                            controller: EMAIL,
                          ),
                        ),
                      ),
                Positioned(
                          top: 314.05377197265625,
                          left: 579.445068359375,
                           child:  SizedBox(
                  height: 50,
                  width: 270,
                  child:
                  TextField(
                    decoration: const InputDecoration(label:
                    Text("Gender"),
                        hintText: "Please write your username"
                    ),
                    controller: GENDER,
                  ),
                ),
                      ),



                      Positioned(
                          top: 461.4560546875,
                          left: 1000.6547241210938,
                          child: Transform.rotate(
                            angle: 0.08132994503872674 * (3.742 / 180),
                            child: Container(
                                width: 186,
                                height: 72,
                                decoration: const BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                  color : Color.fromRGBO(207, 199, 8, 1),
                                )
                            ),
                          )
                      ),Positioned(
                          top: 482.3822021484375,
                          left: 1052.6845703125,
                          child: Transform.rotate(
                            angle: 0.08132994503872674 * (3.742 / 180),
                            child: TextButton(onPressed: () {
                              send(context);
                            },
                              child: const Text('Submit', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 25,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),),
                          )
                      ),
                ),
              Positioned(
                          top: 190.11521911621094,
                          left: 579.7666015625,
                        child:  SizedBox(
                          height: 50,
                          width: 270,
                          child:
                           TextField(
                            decoration: const InputDecoration(label:
                            Text("Surname"),
                                hintText: "Please write your username"
                            ),
                            controller: SURNAME,
                          ),
                        ),
                      )
                      ,Positioned(
                          top: 247.5495147705078,
                          left: 273.8478088378906,
                        child:  SizedBox(
                          height: 50,
                          width: 270,
                          child:
                          TextField(
                            decoration: const InputDecoration(label:
                            Text("Age"),
                                hintText: "Please write your username"
                            ),
                            controller: AGE,
                          ),
                        ),
                      ),Positioned(
                          top: 131.5496368408203,
                          left: 273.68316650390625,
                        child:  SizedBox(
                          height: 50,
                          width: 270,
                          child:
                           TextField(
                            decoration: const InputDecoration(label:
                            Text("Name"),
                                hintText: "Please write your username"
                            ),
                            controller: NAME,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            )
            ));
  }
}
