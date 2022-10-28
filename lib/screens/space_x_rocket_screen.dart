import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spacex/Database/database_helper.dart';
 
import 'package:spacex/models/space_x_model.dart';
import 'package:spacex/screens/rocket_description_page.dart';
import 'package:sqflite/sqlite_api.dart';

class SpaceXRocket extends StatefulWidget {
  @override
  _SpaceXRocketState createState() => _SpaceXRocketState();
}

class _SpaceXRocketState extends State<SpaceXRocket>
    with AutomaticKeepAliveClientMixin<SpaceXRocket> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<SpaceXModel> sapceXRockets = [];
  @override
  void initState() {
    super.initState();
    insertDataIntoLocalDatabase();
  }

  /// ------ Getting Space X Rocket Details  ------ ///
  insertDataIntoLocalDatabase() async {
    try {
      var response = await Dio().get('https://api.spacexdata.com/v4/rockets');
      List data = response.data;
      for (var i in data) {
        // sapceXRockets.add(SpaceXModel.fromJson(i));
        setState(() {
          databaseHelper.insertRocket(SpaceXModel.fromJson(i));
          rocketListDataFromLocalDB();
        });
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  /// ----- Get Data From LocalDb ----- ///
  void rocketListDataFromLocalDB() {

    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<SpaceXModel>> rocketsListFuture = databaseHelper.getRocketList();
      rocketsListFuture.then((rocketList) {
        setState(() {
          sapceXRockets = rocketList;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceXRocket'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: sapceXRockets.isEmpty
                ? const Center(child: Text("Loading......."))
                : ListView.builder(
                    itemCount: sapceXRockets.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => RocketDescriptionPage(
                        //               rocket: sapceXRockets[index])));
                        // },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 50,
                                  // backgroundImage: NetworkImage(
                                  //     sapceXRockets[index].flickrImages[0]),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Column(
                                    children: [
                                      Text(sapceXRockets[index].name),
                                      Text(sapceXRockets[index].company),
                                      Text(sapceXRockets[index].country),
                                      Text(sapceXRockets[index]
                                          .firstFlight
                                          .toString()),
                                      Text(sapceXRockets[index]
                                          .isFavourite
                                          .toString())
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      print("Icon Tapped..............................");
                                      print(sapceXRockets[index]
                                                      .isFavourite.toString());
                                                      print(sapceXRockets[index]
                                                      .isFavourite.runtimeType);
                                                      print(0.runtimeType);
                                      /// ---- Updating data to localdb ---- ///
                                      databaseHelper.updateRocket(SpaceXModel(
                                          height: sapceXRockets[index].height,
                                          diameter:
                                              sapceXRockets[index].diameter,
                                          mass: sapceXRockets[index].mass,
                                          flickr_images:
                                              sapceXRockets[index].flickr_images,
                                          name: sapceXRockets[index].name,
                                          type: sapceXRockets[index].type,
                                          active: sapceXRockets[index].active,
                                          stages: sapceXRockets[index].stages,
                                          boosters:
                                              sapceXRockets[index].boosters,
                                          costPerLaunch: sapceXRockets[index]
                                              .costPerLaunch,
                                          successRatePct: sapceXRockets[index]
                                              .successRatePct,
                                          firstFlight:
                                              sapceXRockets[index].firstFlight,
                                          country: sapceXRockets[index].country,
                                          company: sapceXRockets[index].company,
                                          wikipedia:
                                              sapceXRockets[index].wikipedia,
                                          description:
                                              sapceXRockets[index].description,
                                          id: sapceXRockets[index].id,
                                          isFavourite: sapceXRockets[index]
                                                      .isFavourite ==
                                                  1
                                              ? 0
                                              : 1
                                              
                                              ));
                                      /// ---- After update the data to local db we need to get the updated data ---- ///
                                      rocketListDataFromLocalDB();
                                    },
                                    child: Icon(
                                      Icons.star,
                                      color:
                                          sapceXRockets[index].isFavourite == 1
                                              ? Colors.amber
                                              : Colors.red,
                                    ))
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
