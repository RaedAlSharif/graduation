import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graduation_project/responsive.dart';
import 'package:http/http.dart' as http;

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> with SingleTickerProviderStateMixin {
  TabController? _tabController; // Declare TabController

  List Appointments = [];
  List doctors = [];
  List patients = [];
  //List<dynamic> doctorList = [];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _SURnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();

  TextEditingController id_patient = TextEditingController();
  TextEditingController id_doctor = TextEditingController();

  TextEditingController id_doctor_del = TextEditingController();

  String  error_M = "";
  String  error_M2 = "";
  String  error_M3 = "";
  double size = 0;
  double size2 = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // Initialize TabController
    getAppointments();
    fetchDoctors();
    fetchPatients();

  }

  @override
  void dispose() {
    _tabController?.dispose(); // Dispose TabController
    super.dispose();
  }

   getAppointments() async {
    var url = Uri.parse("http://localhost/PhpProject1/getData.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        Appointments = json.decode(response.body);
      });
    }
    print(Appointments);
    print("above me");
    return Appointments;
  }

   fetchDoctors() async {
    final doctorsResponse = await http.get(Uri.parse("http://localhost/PhpProject1/Doctors_SingIn.php"));

    if (doctorsResponse.statusCode == 200) {
      setState(() {
        doctors = json.decode(doctorsResponse.body);
size2 = doctors.length * 100;
      });
    }
    print(doctors.length);
    return doctors;
  }

   fetchPatients() async {
    final patientsResponse = await http.get(Uri.parse("http://localhost/PhpProject1/SignIn.php"));

    if (patientsResponse.statusCode == 200) {
      setState(() {
        patients = json.decode(patientsResponse.body);
        size = patients.length * 100;
      });
    }
    return patients;
  }

//need update
  int id = 1;
  Future addDoctor(BuildContext cont) async{
    var url = await (Uri.parse("http://localhost/PhpProject1/add_doctor.php")
    );
     /*setState(() {
      id = (doctors.length + 1);
     });*/
    while(if_doctor_exits2()){
      setState(() {
        id++;
      });
    }
    print(id.toString());

    var response = await http.post(url ,
        body: {
          "NAME": _nameController.text,
        "SURNAME": _SURnameController.text,
       "IDDOCTORS": id.toString(),
        "EMAIL": _emailController.text,
        "SPECIALITY" : _departmentController.text,
        "PASSWORD": _passwordController.text
        });
    var data = json.decode(response.body);
    print(data);
  }

  //need update
  Future deleteDoctor(BuildContext cont) async {
    final url = Uri.parse('http://localhost/PhpProject1/delete_doctor.php');
    var response = await http.post(url ,
        body: {
          "IDDOCTORS": id_doctor_del.text,
        });
    var data = json.decode(response.body);
    print(data);
  }

  //needs updates
  Future updatePatientDoctor(BuildContext cont) async  {
    final url = Uri.parse('http://localhost/PhpProject1/update_patients_doctor.php');
    var response = await http.post(url ,
        body: {
          "IDDOCTORS": id_doctor.text,
          "IDPATIENT": id_patient.text,
        });
    var data = json.decode(response.body);
    print(data);
  }

  void showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
          actions: [
            ResponsiveWidget.isSmallScreen(context) ?
            const SizedBox(
            ) :
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage()));
                }, child: Text("Refresh") ,style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white,)))
              ],
            ),

          ],
          bottom: TabBar(
            controller: _tabController, // Assign TabController
            tabs: const [
              Tab(text: 'Home'),
              Tab(text: 'Add Doctor'),
              Tab(text: 'Patients'),
              Tab(text: 'Delete Doctors'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController, // Assign TabController
          children: [
            ListView.builder(
              itemCount: Appointments.length,
              itemBuilder: (context, index) {
                return ListTile(
                    dense: false,
                    subtitle: Text(

                    "Patients's Name: " +
                    Appointments[index]['name'] +
                    "\n""Patients's Surname: " +
                    Appointments[index]['surname'] +
                    "\n""Patients's E-mail: " +
                    Appointments[index]['email'] +
                    "\n""Patients's age: " +
                    Appointments[index]['age'].toString() +
                    "\n""Appontment's Time: " +
                    Appointments[index]['time'] +
                    "\n""Appontment's Date: " +
                    Appointments[index]['date'] +
                    "\n\n",

                ));
              },
            ),
            Center(

              child: Container(
                height: 400,
                width: 450,
                child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    onChanged: (text) {
                      setState(() {
                        error_M = "";
                      });
                    },
                  ),
                  TextFormField(
                    controller: _SURnameController,
                    decoration: const InputDecoration(labelText: 'Surname'),
                    onChanged: (text) {
                      setState(() {
                        error_M = "";
                      });
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    onChanged: (text) {
                      setState(() {
                        error_M = "";
                      });
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    onChanged: (text) {
                      setState(() {
                        error_M = "";
                      });
                    },
                  ),
                  TextFormField(
                    controller: _departmentController,
                    decoration: const InputDecoration(labelText: 'Department'),
                    onChanged: (text) {
                      setState(() {
                        error_M = "";
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text('Add Doctor', ) ,style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, foregroundColor: Colors.white,),
                    onPressed: () {
                       if (_nameController.text.isNotEmpty &&
                          _SURnameController.text.isNotEmpty &&
                          _departmentController.text.isNotEmpty &&
                          _emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                         if (_passwordController.text.length >= 6) {
                           if (met()) {
                             addDoctor(context);
                             showSuccessDialog("Doctor added successfully");
                             initState();
                           }
                           else{
                                setState(() {
                                error_M = "Doctor already exist please change the name";
                             });
                           }
                         }
                         else{
                          setState(() {
                            error_M = "Password must be at least 6 characters";
                        });
                                }
                         }
                    else{
                        setState(() {
                         error_M = "Fill all the requirements";
                         });
    }
                       },
                  ),
                  Text(error_M , style: TextStyle(color: Colors.red),)
                ],
              ),
            ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                SizedBox(
                height: size,
                child: ListView.builder(
                    itemCount: patients.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          dense: false,
                          subtitle: Text(

                            "Patients's Name: " +
                                patients[index]['name'] +
                                patients[index]['surname'] +
                                "\n""Patients's E-mail: " +
                                patients[index]['email'] +
                                "\n""Patients's age: " +
                                patients[index]['age'].toString() +
                                "\n""Patient's id: " +
                                patients[index]['idPatients'].toString() +
                                "\n""Id for this Patient's Doctor: " +
                                patients[index]['idDoctors'].toString() +

                                "\n\n",

                          ));
                    },
                  ),
                ),
                  TextField(
                    controller: id_patient,
                    decoration: const InputDecoration(
                      labelText: "Patient's id",
                    ),
                    onChanged: (text) {
                      setState(() {
                        error_M2 = "";
                      });
                    },
                  ),
                  TextField(
                    controller: id_doctor,
                    decoration: const InputDecoration(
                      labelText: "New Doctor's id",
                    ),
                    onChanged: (text) {
                      setState(() {
                        error_M2 = "";
                      });
                    },
                  ),

                  ElevatedButton(onPressed: () {
                    if(id_doctor.text.isNotEmpty && id_patient.text.isNotEmpty){
                      if(if_doctor_exits()){
                        if(if_patient_exits()) {
                          updatePatientDoctor(context);
                          showSuccessDialog("Updated successfully");
                        }
                        else{
                          setState(() {
                            error_M2 = "Patient not found";
                          });
                        }
                      }
                      else{
                        setState(() {
                          error_M2 = "Doctor not found";
                        });
                      }
                    }
                  },
                    child: const Text("Update"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, foregroundColor: Colors.white),
                  ),
                  Text(error_M2)
                ],
              ),
            ),
            SingleChildScrollView(
              child: Center(
              child: Column(
                children: [
                   TextField(

                    controller: id_doctor_del,
                    decoration: const InputDecoration(
                      labelText: "Enter the ID of the doctor you want to delete",
                    ),
                    onChanged: (text) {
                      setState(() {
                        error_M3 = "";
                      });
                    },
                  ),

                  ElevatedButton(onPressed: () {
                    if(id_doctor_del.text.isNotEmpty){
                      if(if_doctor_del_exits()){
                      if(if_doctor_has_patients()){
                          deleteDoctor(context);
                          initState();
                          showSuccessDialog("Doctors deleted successfully");
                      }
                      else{
                        setState(() {
                          error_M3 = "This doctor still has patient/s, you need to remove "
                              "all his patients in order to complete deletion";
                        });
                      }
                      }
                      else{
                        setState(() {
                          error_M3 = "Doctor ID does not exist";
                        });
                      }
                    }
                  },
                    child: const Text("Delete"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, foregroundColor: Colors.white),
                  ),
                  Text(error_M3 + "\n"),

                  SizedBox(
                    height: size2,
                    child: ListView.builder(
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            dense: false,
                            subtitle: Text(
                              "Doctor's Name: " +
                                  doctors[index]['name'] +
                                  doctors[index]['surname'] +
                                  "\n""Doctors's E-mail: " +
                                  doctors[index]['email'] +
                                  "\n""Doctor's speciality: " +
                                  doctors[index]['speciality'].toString() +
                                  "\n""Doctor's ID: " +
                                  doctors[index]['idDoctors'].toString() +
                                  "\n\n",

                            ));
                      },
                    ),
                  )
                ],
              ),
            )
            )


          ],
        ),
      ),
    );
  }
  bool if_patient_exits(){
    for(int i =0; i<patients.length;i++){
      if (patients[i]["idPatients"].toString() == id_patient.text){
        return true;
      }
    }
    return false;
  }
  bool if_doctor_exits(){
    for(int i =0; i<doctors.length;i++){
      print(id_doctor.text);
      print(doctors[i]["idDoctors"]);
      if (doctors[i]["idDoctors"].toString() == id_doctor.text){
        return true;
      }
    }
    return false;
  }

  bool if_doctor_exits2(){
    for(int i =0; i<doctors.length;i++){
      if (doctors[i]["idDoctors"].toString() == id.toString()){
        return true;
      }
    }
    return false;
  }

  bool if_doctor_del_exits(){
    for(int i =0; i<doctors.length;i++){
      if (doctors[i]["idDoctors"].toString() == id_doctor_del.text){
        return true;
      }
    }
    return false;
  }
  bool if_doctor_has_patients(){
    for(int i =0; i<patients.length;i++){
      if (patients[i]["idDoctors"].toString() == id_doctor_del.text){
        return false;
      }
    }
    return true;
  }

  bool met(){
    for (int i = 0; i < doctors.length; i++) {
      if (doctors[i]["name"] == _nameController.text) {
        return false;
      }
    }
    return true;
  }
}