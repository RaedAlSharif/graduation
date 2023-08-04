import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class D_Main extends StatefulWidget {
  String name;
  int id;
   D_Main({Key? key , required this.name , required this.id}) : super(key: key);

  @override
  State<D_Main> createState() => _D_MainState(name , id);

}

class _D_MainState extends State<D_Main> {
   String name;
   int id;
  _D_MainState(this.name , this.id);
   TextEditingController _nameController = TextEditingController();
   TextEditingController _emailController = TextEditingController();
   TextEditingController report = TextEditingController();

   String rep_Doc_id = "";
   String  rep_P_id = "";

   double size = 0;

   Future send(BuildContext cont) async{
     print(rep_Doc_id);
     print(rep_P_id);
     print(report.text);
     var url = await (Uri.parse("http://localhost/PhpProject1/CreateReport.php")
     );
     var response = await http.post(url , body: {
       "idDoctors" : rep_Doc_id,
       "idPatients" : rep_P_id,
       "CONTENT" : report.text,
     });
     var data = json.decode(response.body);
     print(data);
   }

   Future send_reserved(BuildContext cont) async{
     var url = await (Uri.parse("http://localhost/PhpProject1/add_to_reserved_appointments.php")
     );
     print(selectedDate != null ? selectedDate.toString().substring(0,10) : '');
     print(selectedTime != null ? selectedTime.toString().substring(10,15) : '');
     print(id.toString());
     var response = await http.post(url ,
         body: {
       "DATE": selectedDate != null ? selectedDate.toString() : '',
       "TIME": selectedTime != null ? selectedTime.toString().substring(10,15) : '',
       "IDDOCTORS" : id.toString(),
     });
     var data = json.decode(response.body);
     print(data);
   }

   String error_M = "";
  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          backgroundColor: Colors.black,
          title:  Container(
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
          bottom:  const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Home",
              ),
              Tab(
                text: "Provide Reports",
              ),
              Tab(
                text: "Schedule",
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: [

            SingleChildScrollView(
        child:
             Container(
               height: 1000,
                child: Column(
                  children: [
                    Text("Welcome Doctor, " + name + "\n\n\n" ,
                      style: TextStyle(fontSize: 30 , color: Colors.blueAccent),
                    ),
                    Text("You can Provide medical Reports for patients that had an appointment with you!! \n\n" ,
                      style: TextStyle(
                        fontSize: 25, color: Colors.green
                      ),
                    ),
                    Text("You can add the date and time of the times that you will be "
                        "unavailable at in order to prevent patients from requesting any appointmentss at those times!!\n\n\n" ,
                      style: TextStyle(
                          fontSize: 25, color: Colors.green
                      ),
                    ),

                    Text("Here are all your upcoming Schedule:\n" ,
                      style: TextStyle(
                          fontSize: 25, color: Colors.indigo
                      ),
                    ),

                    SizedBox(
                      height: size,
                      child: Scaffold(

                          body: ListView.builder(
                              shrinkWrap: true,
                              itemCount: products2.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  //visualDensity: VisualDensity(vertical: 6),
                                  dense: false,
                                  subtitle: Text(

                                    "Patients's Name: " +
                                        products2[i]['name'] +
                                        "\n""Patients's Surname: " +
                                        products2[i]['surname'] +
                                        "\n""Patients's E-mail: " +
                                        products2[i]['email'] +
                                        "\n""Patients's age: " +
                                        products2[i]['age'].toString() +
                                        "\n""Appontment's Time: " +
                                        products2[i]['time'] +
                                        "\n""Appontment's Date: " +
                                        products2[i]['date'] +
                                        "\n\n",
                                    style: TextStyle(fontStyle: FontStyle.normal),
                                  ),
                                  leading: Text((i+1).toString() , style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.indigo
                                  ),),
                                  // title: Text(products[i]['date'] +" " + products[i]["time"]),
                                );
                              })),
                    ),
                  ],
                ),
              ),
            ),


              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    //color : Colors.green,
                  ),
                  height: 400,
                  width: 450,
                  child:  Column(
                      children:  [
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Patient name',
                          ),
                          onChanged: (text) {
                            setState(() {
                              error_M = "";
                            });
                          },
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Patient E-mail',
                          ),
                          onChanged: (text) {
                            setState(() {
                              error_M = "";
                            });
                          },
                        ),
                        /* ElevatedButton(
                      onPressed: () {
                        for (int i =0 ; i< products.length;i++){
                          if (products[i]["idDoctors"] == id){
                            if(products[i]["name"] == _nameController.text){
                              if(products[i]["email"] == _emailController.text){
                                print("ture");
                                setState(() {
                                  rep_Doc_id = products[i]["idDoctors"];
                                  rep_P_id = products[i]["idPatients"];
                                });
                              }
                            }
                          }
                        }
                      },
                      child: Text('Check Patient'),
                    ),*/
                        TextField(
                          controller: report,
                          maxLines: 8,
                          decoration: const InputDecoration(
                            labelText: 'Write the report here',
                          ),
                          onChanged: (text) {
                            setState(() {
                              error_M = "";
                            });
                          },
                        ),
                        ElevatedButton(onPressed: () {
                          if(_nameController.text.isNotEmpty && _emailController.text.isNotEmpty && report.text.isNotEmpty){
                            for (int i =0 ; i< products.length;i++){
                              print(i);
                              if (products[i]["idDoctors"] == id){
                                if(products[i]["name"] == _nameController.text){
                                  if(products[i]["email"] == _emailController.text){
                                    print("ture");
                                    //String x = products[i]["idDoctors"].toString();
                                    setState(() {
                                      rep_Doc_id = products[i]["idDoctors"].toString();
                                      rep_P_id = products[i]["idPatients"].toString();
                                    });
                                    send(context);
                                    Success2();
                                    break;
                                  }
                                  /*  else{
                              setState(() {
                                error_M = "email not found";
                              });
                            }

                          else{
                            setState(() {
                              error_M = "name not found";
                            });
                          }

                        else{
                          setState(() {
                            error_M = "Docs id";
                          });
                        }*/
                                }
                              }
                            }
                          }
                        },
                          child: const Text("Send Report"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, foregroundColor: Colors.white),
                        ),
                        Text(error_M , style: TextStyle(color: Colors.red),)
                      ],
                    ),
                ),
              ),



Center(
      child: Container(
        height: 400,
        width: 450,
              child: Column(
        children: [
          const Text("Choose the Date and time of the sessions you are not available at"),
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
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
              onPressed: () {

            if(selectedTime != null && selectedDate != null){
        if ( (selectedTime != null ? selectedTime!.toString().substring(13, 15) : '') == "00" ||
        (selectedTime != null ? selectedTime!.toString().substring(13, 15) : '') == "30") {
          send_reserved(context);
          Success();
        }
        }
          },
              child: const Text("Approve"))
        ],
      ),
      )
)
          ],
        ),
      ),
    );
  }

  List products = [];
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

   List products2 = [];
   List temp = [];
   getData_appointments() async {

     var url = await (Uri.parse("http://localhost/PhpProject1/getData.php"));
     var response = await http.get(url);
     if ( response.statusCode == 200){
       setState(() {
         temp = json.decode(response.body);

         for(int i =0; i< temp.length; i++){
           if(temp[i]["idDoctors"] == id){

             setState(() {
              products2.add(temp[i]);
             });
           }
         }
           size = products2.length * 100;
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
     getData_appointments();

   }

  /* Future<Widget> Report()async {
    return Scaffold(
       body: Column(
         children: [
           TextField(
             controller: report,
             maxLines: 8,
             decoration: const InputDecoration(
               labelText: 'Write the report here',

             ),
           ),
           ElevatedButton(onPressed: () {
             send(context);
             Success();
           },
               child: const Text("Send Report"))
         ],
       ),
     );
   }*/
   Future Success() => showDialog(
     context: context,
     builder: (context) => const AlertDialog(
       backgroundColor: Colors.black45,
       title: Text("Success",
           style: TextStyle(color: Colors.yellowAccent)
       ),
       content:Text("Patients will not be allowed to make appointments at this time", style: TextStyle(color: Colors.white)),

     ),
   );
   Future Success2() => showDialog(
     context: context,
     builder: (context) => const AlertDialog(
       backgroundColor: Colors.black45,
       title: Text("Report Sent Successfully",
           style: TextStyle(color: Colors.yellowAccent)
       ),
     ),
   );
   DateTime? selectedDate;
   TimeOfDay? selectedTime;
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
}
