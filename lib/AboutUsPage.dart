import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:graduation_project/responsive.dart';

import 'UserSignup.dart';
import 'User_login.dart';
import 'carousel.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.blueGrey,
                  child: const AspectRatio(
                    aspectRatio: 18 / 8,
                    child: DestinationCarousel(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Us:',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Our only branch is located in Al-Zarqa city'),
                subtitle: GestureDetector(
                  onTap: () => launch(
                      'https://www.google.com/maps/place/32%C2%B004\'34.8%22N+36%C2%B004\'27.9%22E/@32.0763392,36.0722371,17z/data=!3m1!4b1!4m4!3m3!8m2!3d32.0763392!4d36.0744258?hl=en-SA&entry=ttu'),
                  child: Text(
                    'Near Ma’sum circle\n'
                        'Ma’sum district\n'
                        'Al-Zarqa\n'
                        'Jordan\n'
                        'Tap image to view on maps',
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('(+962) 77 951 4549'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('SpecializationCenter@hotmail.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Testimonial {
  final String author;
  final String text;

  Testimonial(this.author, this.text);
}