import 'package:flutter/material.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final List<String> images = [
    'images/2.jpeg',
    'images/1.jpg',
    'images/3.jpeg',
    'images/4.jpeg',
    'images/5.jpg',
    'images/6.jpeg',
  ];

  final List<String> places = [
    'Medical care',
    'Physiotherapy',
    'Rehabilitation',
    'Causes of firm pain',
    'Cupping',
    '',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        PageView.builder(
          itemCount: images.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                images[index],
                fit: BoxFit.contain,
              ),
            );
          },
        ),

        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              places[_currentPage],
              style: TextStyle(
                letterSpacing: 8,
                fontFamily: 'Electrolize',
                fontSize: screenSize.width / 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 17 / 8,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: screenSize.width / 8,
                right: screenSize.width / 8,
              ),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height / 50,
                    bottom: screenSize.height / 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(places.length, (index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 80,
                                bottom: screenSize.height / 90,
                              ),
                              child: Text(
                                places[index],
                                style: TextStyle(
                                  color: _currentPage == index
                                      ? Theme.of(context)
                                      .primaryTextTheme
                                      .button!
                                      .decorationColor
                                      : Theme.of(context)
                                      .primaryTextTheme
                                      .button!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: _currentPage == index,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 400),
                              opacity: _currentPage == index ? 1 : 0,
                              child: Container(
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                width: screenSize.width / 10,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}