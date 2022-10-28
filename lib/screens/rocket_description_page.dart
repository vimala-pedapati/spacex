import 'package:flutter/material.dart';
import 'package:spacex/customs/caurousel_sleder.dart';
import 'package:spacex/models/space_x_model.dart';

class RocketDescriptionPage extends StatefulWidget {
  RocketDescriptionPage({super.key, required this.rocket});
  SpaceXModel rocket;

  @override
  State<RocketDescriptionPage> createState() => _RocketDescriptionPageState();
}

class _RocketDescriptionPageState extends State<RocketDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.rocket.name),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Carousel(
          //   images: widget.rocket.flickrImages,
          // ),
          Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  const Text("DESCRIPTION", style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Rocket Launch"),
                          Text(widget.rocket.firstFlight.toString().substring(0,10) )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Launch Cost"),
                          Text(widget.rocket.costPerLaunch.toString())
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Success Rate"),
                          Text(widget.rocket.successRatePct.toString())
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Active"),
                          Text(widget.rocket.active.toString())
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(height: 1,
                  color: Colors.grey[300],),
                   const SizedBox(
                    height: 10,
                  ),
                  Text(widget.rocket.description, textAlign: TextAlign.justify,)
                ],
              ),
            ),
          ),
           Card(
            child: Padding(
               padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  const Text("SPECIFICATIONS",style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Name"),
                    Text(widget.rocket.name)
                  ],),
                   const SizedBox(height: 10,),
                  Divider(
                    color: Colors.grey[300],
                    height: 1,
                  ),
                   const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Height"),
                    Text("${widget.rocket.height}m")
                  ],),
                   const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Diameter"),
                    Text('${widget.rocket.diameter}m')
                  ],),
                   const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Mass"),
                    Text("${widget.rocket.mass}kg")
                  ],),
                   const SizedBox(height: 5,),
                  
                ],
              ),
            ),
           )
        ]),
      ),
    );
  }
}
