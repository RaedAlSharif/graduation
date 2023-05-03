import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AppointmentRequest.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return  SingleChildScrollView(



      child: Container(
        width: 1440,
        height: 4096+1024,
        decoration: const BoxDecoration(
          color : Color.fromRGBO(122, 238, 93, 1),
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 74,
                  left: 604,
                  child: Container(
                      width: 526.4956665039062,
                      height: 27.520017623901367,

                      child: Stack(
                          children: <Widget>[
                            const Positioned(
                                top: 0,
                                left: 0,
                                child: Text('Medical Reports History', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),const Positioned(
                                top: 1.009946584701538,
                                left: 227.11341857910156,
                                child: Text('Contact us', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),Positioned(
                                top: 1.009946584701538,
                                left: 340.1654052734375,
                                child: TextButton( onPressed: () { Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => AppointmentRequest()));
                                  }, child: const Text('Request Appointment', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),),
                            ),)
                          ]
                      )
                  )
              ),Positioned(
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
                                      boxShadow : [const BoxShadow(
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
                                      boxShadow : [const BoxShadow(
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
              ),Positioned(
                  top: 145,
                  left: 135,
                  child: Container(
                    width: 1232,
                    height: 810,

                    child: Stack(
                        children: <Widget>[
                        Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 1232,
                            height: 810,
                            decoration: BoxDecoration(
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
                            )
                        )
                    ),Positioned(
                    top: 147.15267944335938,
                    left: 159.9256591796875,
                    child: Transform.rotate(
                        angle: -0.08137150825133167 * (3.742 / 180),
                        child: const Text('Move your body,'
                            'Live your Life', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(50, 208, 24, 1),
                        fontFamily: 'Inter',
                        fontSize: 50,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  )
              ),Positioned(
                  top: 280,
                  left: 160.03439331054688,
                  child: Transform.rotate(
                    angle: -0.08137150825133167 * (3.742 / 180),
                    child: const Text('All types of physical Therapy tbc', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(50, 208, 24, 1),
                        fontFamily: 'Inter',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  )
              ),
            ]
        )
    )
    ),const Positioned(
    top: 59,
    left: 138,
    child: Text('Specialzation center'
    'Logo', textAlign: TextAlign.left, style: TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Inter',
    fontSize: 30,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),)
    ),
        const Positioned(
            top: 177.9234619140625+1024,
            left: 95.675537109375,
            child: Text('Location', textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Inter',
                fontSize: 60,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1
            ),)
        ),const Positioned(
          top: 352.9234619140625+1024,
          left: 95.675537109375,
          child: Text('Our only branch is at Al-Zarqa city  \n'
              'near Ma’sum circle \n'
              'Ma’sum district, \n'
              'Al-Zarqa \n'
              'Jordan. \n'
              'https://maps.app.goo.gl/SmJDqcjCRHiS4RGM8?g_st=iw', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
          fontFamily: 'Inter',
          fontSize: 35,
          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: FontWeight.normal,
          height: 1
      ),)
    ),
        const Positioned(
            top: 445+2048,
            left: 235,
            child: Text('stroke \n'
                'spinal cord injury \n'
                'fascial palsy \n'
                'multiple sclerosis \n'
                'muscular dystrophy \n'
                'Gulline Barre syndrome \n'
                'Traumatic brain injury \n'
                'Parkinson’s disease \n'
                'Muscular dystrophy \n'
                'Amyotrophic lateral syndrome \n'
                'Peripheral nerves injuries', textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Inter',
            fontSize: 20,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1
        ),)
    ),const Positioned(
    top: 302+2048,
    left: 970,
    child: Text('Kids', textAlign: TextAlign.left, style: TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Inter',
    fontSize: 50,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),)
    ),const Positioned(
    top: 302+2048,
    left: 592,
    child: Text('Adult'
        , textAlign: TextAlign.left, style: TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Inter',
    fontSize: 50,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),)
    ),const Positioned(
    top: 302+2048,
    left: 272,
    child: Text('Elder', textAlign: TextAlign.left, style: TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Inter',
    fontSize: 50,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),)
    ),const Positioned(
    top: 93+2048,
    left: 114,
    child: Text('We provide several Physical Therapy Treatments \n'
        'for both Genders and all Ages.', textAlign: TextAlign.left, style: TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Inter',
    fontSize: 50,
    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
    fontWeight: FontWeight.normal,
    height: 1
    ),)
    ),
        const Positioned(
            top: 77+3072,
            left: 100,
            child: Text('Contact Details: +962 77 951 4549 \n'
                'SpecializationCenter@hotmail.com \n'
                'Whatts: +962 77 951 4549', textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Inter',
            fontSize: 25,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1
        ),)
    ),Positioned(
    top: 77+3072,
    left: 620,
    child: Container(
    width: 72.27827453613281,
    height: 72.27827453613281,

    child: Stack(
    children: <Widget>[
    Positioned(
    top: 0,
    left: 0,
    child: SvgPicture.asset(
    'assets/icons/v2.svg'
    )
    ),
    ]
    )
    )
    ),Positioned(
    top: 77+3072,
    left: 866,
    child: Container(
    width: 72.27827453613281,
    height: 72.398681640625,

    child: Stack(
    children: <Widget>[
    Positioned(
    top: 0+3072,
    left: 0,
    child: SvgPicture.asset(
    'assets/v1.svg'
    )
    ),Positioned(
    top: 24.061967849731445+3072,
    left: 24.057987213134766,
    child: SvgPicture.asset(
    'assets/v4.svg'
    )
    ),
    ]
    )
    )
    ),Positioned(
    top: 194+3072,
    left: 100,
    child: Container(
    width: 72.27827453613281,
    height: 72.6230239868164,

    child: Stack(
    children: <Widget>[
    Positioned(
    top: 0,
    left: 0,
    child: SvgPicture.asset(
    'assets/images/v3.svg',
    semanticsLabel: 'vector'
    )
    ),
    ]
    )
    )
    ),Positioned(
    top: 84+3072,
    left: 743,
    child: Container(
    width: 72.27827453613281,
    height: 58.706790924072266,

    child: Stack(
    children: <Widget>[
    Positioned(
    top: 0,
    left: 0,
    child: SvgPicture.asset(
    'assets/images/v5.svg',
    semanticsLabel: 'vector'
    )
    ),
    ]
    )
    )
    ),Positioned(
    top: 84+3072,
    left: 989,
    child: Container(
    width: 72.27827453613281,
    height: 50.602413177490234,

    child: Stack(
    children: <Widget>[
    Positioned(
    top: 0,
    left: 0,
    child: SvgPicture.asset(
    'assets/images/v6.svg',
    semanticsLabel: 'vector'
    )
    ),
    ]
    )
    )
    ),
    ]
    )
    ),
    );
  }
}



