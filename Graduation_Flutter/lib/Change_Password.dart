import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/responsive.dart';
import 'package:http/http.dart' as http;
class ChangePassword extends StatefulWidget {
  String email;
   ChangePassword({Key? key , required this.email }) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState(this.email);
}

class _ChangePasswordState extends State<ChangePassword> {

   String email;
   _ChangePasswordState( this.email);

  TextEditingController pass_cont = new TextEditingController();
  TextEditingController confirm_cont = new TextEditingController();



  Future send(BuildContext cont) async{
    var url = await (Uri.parse("http://localhost/PhpProject1/update_password.php")
    );
    var response = await http.post(url , body: {
      "NEW_PASS" : pass_cont.text,
      "Email" : email,
    });
    var data = json.decode(response.body);
    print(data);
  }

  String error_M = "";
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
              ? PreferredSize(
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
                controller: pass_cont,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                ),
              ),SizedBox(height: 16.0),
              TextField(
                controller: confirm_cont,
                decoration: const InputDecoration(
                  labelText: 'Confirm new Password',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (pass_cont.text.isNotEmpty){
                    if(pass_cont.text.length >= 6 ){
                      if(confirm_cont.text == pass_cont.text){
                        send(context);
                      }
                      else{
                        setState(() {
                          error_M = "Confirmed password does not match new password";
                        });
                      }
                    }
                    else{
                      setState(() {
                        error_M = "Password should be at least 6 characters";
                      });
                    }
                  }
                  else{
                    setState(() {
                      error_M = "Please enter your new Password";
                    });
                  }
                },
                child: const Text('Change Password'),
              ),

              Text("\n" +error_M + "\n"),
            ]
        )
    );
  }
   Future Success() => showDialog(
     context: context,
     builder: (context) => const AlertDialog(
       backgroundColor: Colors.black45,
       title: Text("Password Changed Successfully",
           style: TextStyle(color: Colors.yellowAccent)
       ),
     ),
   );
}
