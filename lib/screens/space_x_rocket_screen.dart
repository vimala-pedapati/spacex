import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spacex/Database/database_helper.dart';

import 'package:spacex/models/space_x_model.dart';
import 'package:spacex/screens/rocket_description_page.dart';
import 'package:spacex/utils/utils.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:async';
class SpaceXRocket extends StatefulWidget {
  @override
  _SpaceXRocketState createState() => _SpaceXRocketState();
}

class _SpaceXRocketState extends State<SpaceXRocket>
    with AutomaticKeepAliveClientMixin<SpaceXRocket> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<SpaceXModel> spaceXRockets = [];



  @override
  void initState() {
    super.initState();
    insertDataIntoLocalDatabase();
    Timer.periodic(const Duration(seconds:1), (timer)=> rocketListDataFromLocalDB() );
  }






  /// ------ Getting Space X Rocket Details  ------ ///
  insertDataIntoLocalDatabase() async {
    int count = 0;
    await databaseHelper.getCount().then((value) => count = value);
    try {
      var response = await Dio().get('https://api.spacexdata.com/v4/rockets');
      List data = response.data;
      if (count == 0) {
        print("if case [R]");
        for (var i in data) {
          setState(() {
            databaseHelper.insertRocket(SpaceXModel.fromJson(i));
            rocketListDataFromLocalDB();
          });
        }
      } else {
        print("else case [R]");
        for (var i in data) {
          var localData = await databaseHelper.getRocketList();
          if (localData.length == count) {
            print("Nothing to Update into local db");
          } else {
            rocketListDataFromLocalDB();
            for (var i in data) {
              for (var j in spaceXRockets) {
                if (i['id'] == j.id) {
                  break;
                }
                setState(() {
                  databaseHelper.insertRocket(SpaceXModel.fromJson(i));
                  rocketListDataFromLocalDB();
                });
              }
            }
          }
          rocketListDataFromLocalDB();
        }
      }
    } catch (e) {
      rocketListDataFromLocalDB();
      print("....................catch error....................[R]");
      print(e);
    }
  }

  /// ----- Get Data From LocalDb ----- ///
  void rocketListDataFromLocalDB() async {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<SpaceXModel>> rocketsListFuture =
          databaseHelper.getRocketList();
      rocketsListFuture.then((rocketList) {
        setState(() {
          spaceXRockets = rocketList;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // insertDataIntoLocalDatabase();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceXRockets'),
        actions: const [
          Icon(Icons.logout),
          SizedBox(
            width: 40,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              child: spaceXRockets.isEmpty
                  ? const Center(child: Text("Loading......."))
                  : ListView.builder(
                      itemCount: spaceXRockets.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RocketDescriptionPage(
                                                    rocket:
                                                        spaceXRockets[index])));
                                  },
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: NetworkImage(Utils()
                                        .getImages(spaceXRockets[index]
                                            .flickr_images)[0]),
                                    // child: Icon(Icons.album),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Name:   ${spaceXRockets[index].name}"),
                                      Text("Company:  ${spaceXRockets[index].company} "),
                                      Text("Country:  ${  spaceXRockets[index].country}"),
                                      Text("First Launch:  ${spaceXRockets[index]
                                           .firstFlight
                                           .substring(0, 10)
                                           .toString()}"),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      /// ---- Updating data to localdb ---- ///
                                      databaseHelper.updateRocket(SpaceXModel(
                                          height: spaceXRockets[index].height,
                                          diameter:
                                              spaceXRockets[index].diameter,
                                          mass: spaceXRockets[index].mass,
                                          flickr_images: spaceXRockets[index]
                                              .flickr_images,
                                          name: spaceXRockets[index].name,
                                          type: spaceXRockets[index].type,
                                          active: spaceXRockets[index].active,
                                          stages: spaceXRockets[index].stages,
                                          boosters:
                                              spaceXRockets[index].boosters,
                                          costPerLaunch: spaceXRockets[index]
                                              .costPerLaunch,
                                          successRatePct: spaceXRockets[index]
                                              .successRatePct,
                                          firstFlight:
                                              spaceXRockets[index].firstFlight,
                                          country: spaceXRockets[index].country,
                                          company: spaceXRockets[index].company,
                                          wikipedia:
                                              spaceXRockets[index].wikipedia,
                                          description:
                                              spaceXRockets[index].description,
                                          id: spaceXRockets[index].id,
                                          isFavourite: spaceXRockets[index]
                                                      .isFavourite ==
                                                  1
                                              ? 0
                                              : 1));

                                      /// ---- After update the data to local db we need to get the updated data ---- ///
                                      rocketListDataFromLocalDB();
                                    },
                                    child: Icon(
                                      Icons.star,
                                      color:
                                          spaceXRockets[index].isFavourite == 1
                                              ? Colors.amber
                                              : Colors.grey,
                                    ))
                            
                              ],
                            ),
                          ),
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
