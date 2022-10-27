
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class Carousel extends StatefulWidget {
  Carousel({Key? key, required this.images}) : super(key: key);
  List images;
  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  // final List<Widget> imageSliders = images
  //     .map((item) => Container(
  //   child: Container(
  //     margin: const EdgeInsets.all(5.0),
  //     child: ClipRRect(
  //         borderRadius: const BorderRadius.all(Radius.circular(5.0)),
  //         child: Stack(
  //           children: <Widget>[
  //             Image.asset(item, fit: BoxFit.fitWidth, width: double.infinity, height: widget.sizingInformation.deviceScreenType == DeviceScreenType.desktop ? 500: 300 ),
  //             Positioned(
  //               bottom: 0.0,
  //               left: 0.0,
  //               right: 0.0,
  //               child: Container(
  //                 decoration: const BoxDecoration(
  //                   gradient: LinearGradient(
  //                     colors: [
  //                       Color.fromARGB(200, 0, 0, 0),
  //                       Color.fromARGB(0, 0, 0, 0)
  //                     ],
  //                     begin: Alignment.bottomCenter,
  //                     end: Alignment.topCenter,
  //                   ),
  //                 ),
  //                 padding: const EdgeInsets.symmetric(
  //                     vertical: 10.0, horizontal: 20.0),
  //                 // child: Text(
  //                 //   'No. ${images.indexOf(item)} image',
  //                 //   style: const TextStyle(
  //                 //     color: Colors.white,
  //                 //     fontSize: 20.0,
  //                 //     fontWeight: FontWeight.bold,
  //                 //   ),
  //                 // ),
  //               ),
  //             ),
  //           ],
  //         )),
  //   ),
  // ))
  //     .toList();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.images
        .map((item) => Container(
              child: Container(

                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item,
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height:250),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Container(
      width: MediaQuery.of(context).size.width,
 
      child: Column(
        children: [

          CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                height:  250,
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: 1,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 6.0,
                  height: 6.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key ? Colors.orange : Colors.grey
                      // color: (Theme.of(context).brightness == Brightness.dark
                      //     ? Colors.red
                      //     : Colors.orange)
                      //     .withOpacity(_current == entry.key ? 1 : 0.4)
                      ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}