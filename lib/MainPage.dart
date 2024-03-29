import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'AboutUsPage.dart';
import 'AppointmentRequest.dart';

class MainPage extends StatefulWidget {
  List products;
  int unit;
  MainPage({Key? key , required this.products , required this.unit}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState(products , unit);
}

class _MainPageState extends State<MainPage> {

  List products;
  int unit;
  _MainPageState(this.products , this.unit);

  final feedback = TextEditingController();
  final name = TextEditingController();
  final Uri _url = Uri.parse( 'https://www.google.com/maps/place/32%C2%B004\'34.8%22N+36%C2%B004\''
      '27.9%22E/@32.0763392,36.0722371,17z/data=!3m1!4b1!4m4!3m3!8m2!3d32.0763392!4d36.0744258?hl=en-SA&entry=ttu');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  List products2 = [];
  List temp = [];
  String report = "No Report for the time being!!" ;
  getReports() async {
    var url = await (Uri.parse("http://localhost/PhpProject1/GetReports.php"));
    var response = await http.get(url);
    if ( response.statusCode == 200){
      setState(() {
        temp = json.decode(response.body);
        for(int i =0 ; i< temp.length;i++){
          if(temp[i]["idDoctors"] == products[unit]["idDoctors"] && temp[i]["idPatients"] == products[unit]["idPatients"]){
            products2.add(temp[i]);
            report = "Report Details: " +temp[i]["Content"];
          }
        }
      });
    }
    print(products2);
    print("above me");
    return products2;
  }
  @override
  void initState() {
    super.initState();
    getReports();
  }
  @override
  Widget build(BuildContext context) {
    Future open() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: TextField(
          decoration:  InputDecoration(
            label: Text("Name"),
            hintText: "Please write your name",
          ),
          controller: name,
        ),
        content:TextField(
          decoration: const InputDecoration(
            label: Text("Comment"),
            hintText: "Please write your name",
          ),
          controller: feedback,
          maxLines: 5,
        ),
        actions: [
          ElevatedButton(onPressed: () {
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
                      'name': name.text,
                      'Dear': "From",
                      'AsR': "New FeedBack",
                      'messageAsR': feedback.text,
                      'TO_EMAIL': "raed__2001@hotmail.com",
                    }
                  },
                )
            );
            setState(() {
              name.clear();
              feedback.clear();
              Navigator.pop(context);
            });
          },
              child: const Text("Submit"))
        ],
      ),);


    Future open2() => showDialog(

      context: context,
      builder: (context) => AlertDialog(
        title:
             Text(report),

      ),);
    /*  XenCardGutter gutter =  XenCardGutter(

      child: Scaffold(
        body: Column(
          children: [



          ],
        ),
      ),
    );*/
    return  SingleChildScrollView(

      child: Container(
          width: 1440,
          height: 3000,
          decoration: const BoxDecoration(
            //color : Colors.indigo,
          ),
          child: Stack(
              children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        color: Colors.black,
                        width: 1600,
                        height: 130,
                        // decoration: BoxDecoration(color: Colors.amberAccent),
                        child: Stack(
                            children: <Widget>[
                              const Positioned(
                                  top: 45,
                                  left: 220,
                                  child:DefaultTextStyle(style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  ), child:  Text('Specialization zone', textAlign: TextAlign.left),
                                  )
                              ),
                              Positioned(
                                  top: 20,
                                  left: 100,

                                  child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset("icons/Logo-modified.png"
                                      ))
                              ),
                              Positioned(
                                top: 59,
                                left: 850,
                                child: TextButton(onPressed: () {
                                  open();
                                }, child:const Text('Provide Feedback', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),),),
                              ),
                              Positioned(
                                top: 59,
                                left: 1025,
                                child: TextButton(onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => AboutUsPage()));
                                },
                                  child:const Text('About us', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),),),
                              ),
                              Positioned(
                                top: 59,
                                left: 650,
                                child: TextButton(onPressed: () {
                                    open2();
                                },
                                  child:const Text('View Medical Report', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),),),
                              ),
                              Positioned(
                                top: 59,
                                left: 1150,
                                child: TextButton( onPressed: () { Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>  AppointmentRequest(products2: products, unit: unit,)));
                                }, child: const Text('Request Appointment', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),),
                                ),),
                               Positioned(
                                top: 40,
                                left: 1400,
                                child: DefaultTextStyle(style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ), child:  Text('Welcome \n' + products[unit]["name"], textAlign: TextAlign.left),
                                )
                              ),
                            ]
                        )
                    )
                )/*Positioned(
                  top: 56,
                  left: 1157,
                  child: Container(
                      width: 107.15044403076172,
                      height: 52.5152587890625,

                      child: Stack(
                          children: <Widget>[
                            const Positioned(
                                top: 17.90297508239746,
                                left: 27.779766082763672,
                                child: Text('Sign in', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 107.15044403076172,
                                    height: 52.5152587890625,
                                    decoration: BoxDecoration(
                                      borderRadius : const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                      boxShadow : const [BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                          offset: Offset(0,4),
                                          blurRadius: 4
                                      )],
                                      color : const Color.fromRGBO(217, 217, 217, 0.10000000149011612),
                                      border : Border.all(
                                        color: const Color.fromRGBO(49, 208, 23, 1),
                                        width: 3,
                                      ),
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 56,
                  left: 1304,
                  child: Container(
                      width: 97.47038269042969,
                      height: 52.5152587890625,

                      child: Stack(
                          children: <Widget>[
                            const Positioned(
                                top: 18.178436279296875,
                                left: 23.216018676757812,
                                child: Text('Sign up', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 97.47038269042969,
                                    height: 52.5152587890625,
                                    decoration: BoxDecoration(
                                      borderRadius : const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                      boxShadow : const [BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                          offset: Offset(0,4),
                                          blurRadius: 4
                                      )],
                                      color : const Color.fromRGBO(217, 217, 217, 0.10000000149011612),
                                      border : Border.all(
                                        color: const Color.fromRGBO(50, 208, 24, 1),
                                        width: 3,
                                      ),
                                    )
                                )
                            ),
                          ]
                      )
                  )
              )*/,Positioned(
                    top: 130,


                    child: Container(
                        width: 1600,
                        height: 810,

                        child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Image.asset("icons/image2.jpg" ,
                                  width: 1600,
                                  height: 620,
                                  fit: BoxFit.fitWidth,
                                ),
                                /*decoration: BoxDecoration(
                              borderRadius : const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(500),
                              ),
                              color : const Color.fromRGBO(217, 217, 217, 1),
                              border : Border.all(
                                color: const Color.fromRGBO(0, 0, 0, 1),
                                width: 1,
                              ),
                            ),*/


                              ),const Positioned(
                                  top: 147.15267944335938,
                                  left: 159.9256591796875,
                                  child:DefaultTextStyle(style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 50,
                                  ), child:  Text('Move your body, \n'
                                      'Live your Life', textAlign: TextAlign.left),
                                  )
                              ),
                              const Positioned(
                                  top: 280,
                                  left: 160.03439331054688,
                                  child:DefaultTextStyle(style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 20,
                                  ), child:  Text('All types of Physical Therapy TBC', textAlign: TextAlign.left),
                                  )
                              ),
                            ]
                        )
                    )
                ),
                Positioned(
                    top: 1900,
                    left: 85,
                    child: Container(
                      height: 700,
                      width: 1400,
                      decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(150),
                            topRight: Radius.circular(150),
                            bottomLeft: Radius.circular(150),
                            bottomRight: Radius.circular(150),
                          )
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                              top: 150,
                              left: 95,
                              child:DefaultTextStyle(style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 60,
                              ) , child: Text('Location', textAlign: TextAlign.left)
                              )
                          ) ,const Positioned(
                              top: 280,
                              left: 95,
                              child:DefaultTextStyle(style:TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 32,
                              ) ,
                                  child: Text('Our only branch is at Al-Zarqa city  \n'
                                      'near Ma’sum circle \n'
                                      'Ma’sum district, \n'
                                      'Al-Zarqa \n'
                                      'Jordan. \n'
                                      'Tab image to view on maps', textAlign: TextAlign.left)
                              )
                          ),
                          Positioned(
                              top: 120,
                              left: 750,
                              child: GestureDetector(
                                onTap: () {
                                  _launchUrl();
                                },
                                child: Container(
                                  height:450 ,
                                  width: 500,
                                  child: const Image(image: AssetImage("icons/maps.jpg"),
                                  ),
                                ),
                              )
                          )
                        ],
                      ),
                    )
                ),

                Positioned(
                    top: 800,
                    left: 85,
                    child: Container(
                      height: 1024,
                      width: 1400,
                      decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(150),
                            topRight: Radius.circular(150),
                            bottomLeft: Radius.circular(150),
                            bottomRight: Radius.circular(150),
                          )
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                              top: 600,
                              left: 555,
                              child: DefaultTextStyle(style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ), child:  Text('STROKE \n'
                                  'SPINAL CORD INJURY \n'
                                  'FACIAL PALSY\n'
                                  'MULTIPLE SCLEROSIS \n'
                                  'MUSCULAR DYSTROPHY \n'
                                  'GULLINE BARRE SYNDROME \n'
                                  'TRAUMATIC BRAIN INJURY \n'
                                  'PARKINSON’s DISEASE \n'
                                  'AYMOTROPHIC LATERAL SYNDROME \n'
                                  'PERIPHERAL NERVES INJURIES', textAlign: TextAlign.left),
                              )
                          ), const Positioned(
                              top: 600,
                              left: 955,
                              child: DefaultTextStyle(style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ), child:  Text('CEREBRAL PALSY \n'
                                  'PARTHES DISEASE \n'
                                  'CEREBRAL PALSY\n'
                                  'DDH \n'
                                  'BIRTH DEFECT\n'
                                  'NEURAL TUBE DEFECT \n'
                                  'SPINA BIFIDA \n'
                                  'TORTICOLLIS \n'
                                  'BRACHIAL PLEXUS INJURY \n'
                                  'DEVELOPMENTAL DYSPLASIA OF THE HIP \n'
                                  'DEVELOPMENTAL DELAY \n'
                                  'DOWN SYNDROME', textAlign: TextAlign.left),
                              )
                          ),  const Positioned(
                              top: 600,
                              left: 160,
                              child: DefaultTextStyle(style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ), child:  Text('MUSCLE SPASM \n'
                                  'DISC \n'
                                  'SCOLIOSIS\n'
                                  'LOW BACK PAIN \n'
                                  'SCIATICA \n'
                                  'NECK PAIN \n'
                                  'KYPHOSIS \n'
                                  'KNEE OSTEOARTHRITIS\n'
                                  'MENISCUS INJURY \n'
                                  'ANKLE SPRAIN \n'
                                  'TENDONITIS \n'
                                  'FRACTURE \n'
                                  'FIBROMYALGIA \n'
                                  'AMPUTATION \n'
                                  'RHEUMATOID ARTHRITIS \n'
                                  'REHABILITATION AFTER JOINT REPLACEMENT', textAlign: TextAlign.left),
                              )
                          ), const Positioned(
                              top: 302,
                              left: 1035,
                              child: DefaultTextStyle(style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 50, ),
                                child: Text('Kids', textAlign: TextAlign.left,
                                ),
                              )),
                          Positioned(
                              top: 390,
                              left: 950,
                              child: Image.asset("icons/KidsImage2.jpg")
                          ),

                          Positioned(
                              top: 390,
                              left: 550,
                              child:Container(
                                  height: 180,
                                  width: 270,
                                  child: Image.asset("icons/adaults1.jpg")
                              )
                          ) ,

                          Positioned(
                              top: 390,
                              left: 150,
                              child: Image.asset("icons/elder1.jpg")
                          ),
                          const Positioned(
                              top: 302,
                              left: 585,
                              child: DefaultTextStyle(style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 50, ),
                                child: Text('Nervous', textAlign: TextAlign.left,
                                ),
                              )
                          ),const Positioned(
                              top: 302,
                              left: 120,
                              child: DefaultTextStyle(style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 50, ),
                                child: Text('Musculoskeletal', textAlign: TextAlign.left,
                                ),
                              )
                          ),const Positioned(
                              top: 93,
                              left: 114,
                              child: DefaultTextStyle(style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Inter',
                                  fontSize: 50
                              ),  child: Text('We provide several Physical Therapy Treatments \n'
                                  'for both Genders and all Ages.', textAlign: TextAlign.left, ))
                          ),
                        ],
                      ),
                    )
                ),
                Positioned(
                    top: 2700,
                    left: 85,
                    child: Container(
                        height: 220,
                        width: 1400,
                        decoration: const BoxDecoration(
                            color: Colors.yellowAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(150),
                              topRight: Radius.circular(150),
                              bottomLeft: Radius.circular(150),
                              bottomRight: Radius.circular(150),
                            )
                        ),
                        child: Stack(
                          children: [
                            const Positioned(
                                top: 77,
                                left: 100,
                                child: DefaultTextStyle(style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ) , child:Text('Contact Details: +962 77 951 4549 \n'
                                    'SpecializationCenter@hotmail.com \n'
                                    'WhatsApp: +962 7 8549 8255', textAlign: TextAlign.left,
                                ),
                                )
                            ),
                            Positioned(
                                top: 77,
                                left: 650,
                                child: GestureDetector(
                                    onTap: () {
                                     launch('https://www.instagram.com/specializationzonecenter/');
                                    },
                                    child: Container(
                                        width: 72,
                                        height: 72,
                                        child: Image.asset(
                                            'icons/instagram.png'
                                        )
                                    )
                                )
                            ),
                            Positioned(
                                top: 77,
                                left: 950,
                                child: GestureDetector(
                                  onTap: () {
                                    launch('https://www.facebook.com/specializationzone?mibextid=LQQJ4d');
                                  },
                                  child: Container(
                                      width: 72,
                                      height: 72,
                                      child: Image.asset("icons/facebook.png")
                                  ),
                                )
                            ),

                            Positioned(
                              top: 77,
                              left: 1100,
                              child: GestureDetector(
                                onTap: () {
                                  launch('https://wa.me/message/6UG22JGXVGCDH1?src=qr');
                                },
                                child: Container(
                                    width: 72,
                                    height: 72,
                                    child: Image.asset(
                                      'icons/whatsapp.png',
                                    )
                                ),
                              ),
                            ),
                            Positioned(
                              top: 84,
                              left: 800,
                              child: GestureDetector(
                                onTap: () {
                                  Uri uri = Uri.parse("");
                                },
                                child: SizedBox(
                                    width: 72,
                                    height: 72,
                                    child: Image.asset(
                                      'icons/youtube.png',
                                    )
                                ),
                              ),
                            )
                          ],
                        )
                    )
                ),
              ]
          )
      ),
    );
  }
}
