import 'package:flutter/material.dart';
import 'package:graduation_project/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AboutUsPage.dart';
import 'UserSignup.dart';
import 'carousel.dart';
import 'user_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Specialization zone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Specialization zone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> _launchUrl() async {
    if (!await canLaunch(_url.toString())) {
      throw Exception('Could not launch $_url');
    }
    await launch(_url.toString());
  }

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
        actions: [
          ResponsiveWidget.isSmallScreen(context) ?
          const SizedBox(

          ) :
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()),
                    );
                  },
                  child: const Text(
                    'About us',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 15,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserSignup()),
                  );
                },
                child: const Text(
                  'Sign Up',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 15,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserLogin()),
                    );
                  },
                  child: const Text(
                    'Login',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 15,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ),
              ),

            ],
          ),

        ],
        bottom: ResponsiveWidget.isSmallScreen(context) ?
        PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: Column (
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserSignup()),
                );
              },
              child: const Text(
                'Sign Up',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Inter',
                  fontSize: 15,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserLogin()),
                  );
                },
                child: const Text(
                  'Login',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 15,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
        ) : PreferredSize(child: SizedBox(), preferredSize: Size(0,0)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(8),
              child:  Row(children: <Widget>[]),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                width: double.infinity,
                height: 500,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("icons/image2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 80, bottom: 100),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 50,
                      ),
                      child: Text(
                        'Move your body, \nLive your Life',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.white,
                child: const AspectRatio(
                  aspectRatio: 18 / 8,
                  child: DestinationCarousel(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.blueAccent,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'We provide several Physical Therapy Treatments \nfor both Genders and all Ages.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Musculoskeletal',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 120,
                                height: 120,
                                child: Image.asset("icons/elder1.jpg"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'MUSCLE SPASM\nDISC\nSCOLIOSIS\nLOW BACK PAIN\nSCIATICA\nNECK PAIN\nKYPHOSIS\nKNEE OSTEOARTHRITIS\nMENISCUS INJURY\nANKLE SPRAIN\nTENDONITIS\nFRACTURE\nFIBROMYALGIA\nAMPUTATION\nRHEUMATOID ARTHRITIS\nREHABILITATION AFTER JOINT REPLACEMENT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Nervous',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 120,
                                height: 120,
                                child: Image.asset("icons/adaults1.jpg"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'STROKE\nSPINAL CORD INJURY\nFACIAL PALSY\nMULTIPLE SCLEROSIS\nMUSCULAR DYSTROPHY\nGULLINE BARRE SYNDROME\nTRAUMATIC BRAIN INJURY\nPARKINSON’s DISEASE\nAYMOTROPHIC LATERAL SYNDROME\nPERIPHERAL NERVES INJURIES',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Kids',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 120,
                                height: 120,
                                child: Image.asset("icons/KidsImage2.jpg"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'CEREBRAL PALSY\nPARTHES DISEASE\nCEREBRAL PALSY\nDDH\nBIRTH DEFECT\nNEURAL TUBE DEFECT\nSPINA BIFIDA\nTORTICOLLIS\nBRACHIAL PLEXUS INJURY\nDEVELOPMENTAL DYSPLASIA OF THE HIP\nDEVELOPMENTAL DELAY\nDOWN SYNDROME',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blueGrey,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Contact Details: +962 77 951 4549 \nSpecializationCenter@hotmail.com \nWhatsApp: +962 7 8549 8255',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Open Instagram link
                                  launch('https://www.instagram.com/specializationzonecenter/');
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset("icons/instagram.png"),
                                ),
                              ),
                              const Text('Instagram'),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Open Facebook link
                                  launch('https://www.facebook.com/specializationzone?mibextid=LQQJ4d');
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset("icons/facebook.png"),
                                ),
                              ),
                              Text('Facebook'),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Open WhatsApp link
                                  launch('https://wa.me/message/6UG22JGXVGCDH1?src=qr');
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset("icons/WhatsApp.png"),
                                ),
                              ),
                              const Text('WhatsApp'),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: Image.asset("icons/youtube.png"),
                              ),
                              const Text('YouTube'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}