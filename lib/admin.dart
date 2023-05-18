import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class admin extends StatefulWidget {
  const admin({Key? key}) : super(key: key);

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {

 List products = [];
   getData() async {
    var url = await (Uri.parse("http://localhost/PhpProject1/getData.php"));
    var response = await http.get(url);
    if ( response.statusCode == 200){
      setState(() {
        products = json.decode(response.body);
      });
    }
   // var body = json.decode(response.body);
  //  products = body;
   //newp = products;
    print(products);
    print("above me");
    return products;
  }


  @override
  void initState() {
    super.initState();
    getData();
    //newp = getData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child:
      //Text(newp.first)
Center(


    child:Container(
      height: 1024,
      width: 500,
        child: Scaffold(
            body: ListView.builder(
              itemExtent: 100,
                itemCount: products.length,
                itemBuilder: (context , i){
                  return ListTile(
                    //visualDensity: VisualDensity(vertical: 6),
                    dense: false,
                    subtitle: Text("Name: " + products[i]['name'] + "\n"
                        "Surname: " + products[i]["surname"] + "\n"
                        "Phone: " + products[i]["phone"] + "\n"
                        "E-mail: " + products[i]["email"] + "\n"
                        "Date: " + products[i]["date"] + "\n"
                        "Time: " + products[i]["time"] ,
                    style: TextStyle(fontStyle: FontStyle.normal) ,),
                    // title: Text(products[i]['date'] +" " + products[i]["time"]),
                    leading: TextButton(onPressed: () async {
                      final url = Uri.parse(
                          'https://api.emailjs.com/api/v1.0/email/send');
                      final response = await http.post(
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
                                'name': products[i]['name'],
                                'AsR': "Appointment Rejected!",
                                'messageAsR': "Unfortunately your appointment request has been rejected. \n"
                                    "We will provide information about the reasons shortly",
                                'TO_EMAIL': products[i]["email"],
                              }
                            },
                          )
                      );
                    },
                      child: Text("Reject"),
                    ),
                    trailing: TextButton(onPressed: () async {
                      final url = Uri.parse(
                          'https://api.emailjs.com/api/v1.0/email/send');
                      final response = await http.post(
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
                                'name': products[i]['name'],
                                'AsR': "Appointment Accepted!",
                                'messageAsR': "Your Specialization center appointment request has been accepted. \n"
                                    "Date: " + products[i]['date'] + "\n"
                                    "Time: "+ products[i]['time'] ,
                                'TO_EMAIL': products[i]["email"],
                              }
                            },
                          )
                      );
                    },
                      child: Text("Accept"),
                    ),
                  );
                }
            )
        )

    )


)


    );
  }
}

