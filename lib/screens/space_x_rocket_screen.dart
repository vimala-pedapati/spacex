import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spacex/global.dart';
import 'package:spacex/models/space_x_model.dart';
import 'package:spacex/screens/rocket_description_page.dart';

class SpaceXRocket extends StatefulWidget {
  @override
  _SpaceXRocketState createState() => _SpaceXRocketState();
}

class _SpaceXRocketState extends State<SpaceXRocket>
    with AutomaticKeepAliveClientMixin<SpaceXRocket> {
 
  @override
  void initState() {
    super.initState();
    getHttp(context);
  }

  /// ------ Getting Space X Rocket Details  ------ ///
  getHttp(context) async {
    try {
      var response = await Dio().get('https://api.spacexdata.com/v4/rockets');
      List data = response.data;
      for (var i in data) {
        sapceXRockets.add(SpaceXModel.fromJson(i));
        setState(() {
          
        });
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("...............");
    print(sapceXRockets);
    print("...............");
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceXRocket'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: sapceXRockets.length == 0
                ? Center(child: Text("Loading......."))
                : ListView.builder(
                    itemCount: sapceXRockets.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder:  (context) => RocketDescriptionPage(rocket: sapceXRockets[index])));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      sapceXRockets[index].flickrImages[0]),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.5,
                                  child: Column(
                                    children: [
                                      Text(sapceXRockets[index].name),
                                      Text(sapceXRockets[index].company),
                                      Text(sapceXRockets[index].country),
                                      Text(sapceXRockets[index].firstFlight.toString()),
                                      Text(sapceXRockets[index].isFavourite.toString())
                                    ],
                                  ),
                                ),
                                const Icon(Icons.star)
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
