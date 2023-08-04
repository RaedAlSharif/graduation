import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:graduation_project/Change_Password.dart';
import 'package:graduation_project/responsive.dart';
import 'package:http/http.dart' as http;

import 'main.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {


  List products =[];
  getData() async {
    var url = await (Uri.parse("http://localhost/PhpProject1/SignIn.php"));
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

  static Stopwatch stopwatch = Stopwatch();
  Duration elapsed = stopwatch.elapsed;


String code = "";
  @override
  void initState() {
    super.initState();
    getData();
  }

String error_M = "";
String error_M2 = "";
  TextEditingController email_Controller = new TextEditingController();
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

      body: Column(
        children: [
          SizedBox(height: 16.0),
          TextField(
            controller: email_Controller,
            decoration: const InputDecoration(
              labelText: 'Enter your E-mail',
            ),
          ),

          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                code = "";
                for(int i =0 ; i< 5; i++){
                int num = Random().nextInt(10);
                code += num.toString();
              }
                _start = 60;
              });
              bool found = false;
              for(int i =0; i< products.length;i++){
                if(_start != 0) {
                  if (products[i]["email"] == email_Controller.text) {
                    setState(() {
                      found = true;
                    });
                    startTimer();
                    main();
                    final url = Uri.parse(
                        'https://api.emailjs.com/api/v1.0/email/send');
                    final response = http.post(
                        url,
                        headers: {
                          'Content-Type': 'application/json'
                        },
                        body: json.encode(
                          {
                            'service_id': 'service_sbp0sc2',
                            'template_id': 'template_gg5sqzl',
                            'user_id': 'DR9oYPKTWE1s9l-w9',
                            'template_params': {
                              'name': "",
                              'Dear': "Enter the following code to continue password resetting procedure",
                              'AsR': "Forget password reset code",
                              'messageAsR': code,
                              'TO_EMAIL': email_Controller.text
                            }
                          },
                        )
                    );
                  }
                }
              }
              if(!found){
                setState(() {
                  error_M = "User E-mail not found or not registered";
                });
              }
              else {
                setState(() {
                error_M = "Verification code sent! Check your Email and enter the code below";
              });
              }

            },
            child: const Text('Send email for verification'),
          ),

          Text("\n" +error_M + "\n"),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [OtpTextField(
            numberOfFields: 5,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
              if(verificationCode == code){
                setState(() {
                  _start = 0;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  ChangePassword(email : email_Controller.text)));
              }
              else{
                setState(() {
                  error_M2 = "The code entered is incorrect or expired";
                });
              }
            }, // end onSubmit
          ),

        Text(_start.toString())
            ]
          ),
          Text(error_M2)
        ],
      )

    );

  }


  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
            print(_start);
          });
        }
      },
    );
  }
  void main() {
    scheduleTimeout(60 * 1000);
  }

  Timer scheduleTimeout([int milliseconds = 10000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);
  void handleTimeout() {
    setState(() {
      code = "hjvbasduybcoad";
      error_M = "Timer ran out try getting a new verification code";
    });
  }
}
