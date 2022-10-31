import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spacex/models/space_x_model.dart';
import 'package:spacex/screens/rocket_description_page.dart';
import 'package:spacex/screens/space_x_rocket_screen.dart';
import 'package:sqflite/sqlite_api.dart';

import '../Database/database_helper.dart';
import '../global.dart';
import '../utils/utils.dart';
import 'auth_screen.dart';

class FavouriteRockets extends StatefulWidget {
  @override
  _FavouriteRocketsState createState() => _FavouriteRocketsState();
}

class _FavouriteRocketsState extends State<FavouriteRockets>
    with AutomaticKeepAliveClientMixin<FavouriteRockets> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<SpaceXModel> favouriteRockets = [];
  bool isEmpty = false;

  getFavouriteRockets() async {
    List<SpaceXModel> rockets = await databaseHelper.getRocketList();
    /// ---- DON'T REMOVE THE FOLLOWING LIST ---- ///

    setState(() {
      favouriteRockets = [];
    });


    for (var i in rockets) {
      if (i.isFavourite == 1) {
        setState(() {
          favouriteRockets.add(i);
        });
      }
    }

  }

  @override
  @override
  void initState() {
    super.initState();

    getFavouriteRockets();
    Timer.periodic(const Duration(seconds:1), (timer)=> getFavouriteRockets() );
    print('initState FavouriteRockets.....[BLUE]');
  }

  @override
  @override
  Widget build(BuildContext context) {
    getFavouriteRockets();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourite Rockets'),
          actions:   [
            IconButton(icon: Icon(Icons.logout),onPressed: (){
              firebaseAuth.signOut();
              Navigator.pushReplacement( context, MaterialPageRoute(builder:  (context)=> const AuthScreen()));
            },),
            SizedBox(
              width: 40,
            )
          ],
        ),
        body: Container(
          child: favouriteRockets.isEmpty
              ? const Center(child: Text("No Favourites yet"))
              : ListView.builder(
                  itemCount: favouriteRockets.length,
                  itemBuilder: (context, index) {
                    return   Row(
                      children: [
                        Card(
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
                                                        favouriteRockets[index])));
                                  },
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: NetworkImage(Utils().getImages(
                                        favouriteRockets[index].flickr_images)[0]),
                                    // child: Icon(Icons.album),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  padding:
                                      const EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Name: ${favouriteRockets[index].name}"),
                                      Text("Company: ${favouriteRockets[index].company}"),
                                      Text("Country: ${ favouriteRockets[index].country}"),
                                      Text("First Launch: ${favouriteRockets[index]
                                          .firstFlight
                                          .substring(0, 10)}")

                                        ,
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {

                                      /// ---- Updating data to localdb ---- ///
                                      setState(() {
                                        databaseHelper.updateRocket(SpaceXModel(
                                            height: favouriteRockets[index].height,
                                            diameter:
                                            favouriteRockets[index].diameter,
                                            mass: favouriteRockets[index].mass,
                                            flickr_images:
                                            favouriteRockets[index].flickr_images,
                                            name: favouriteRockets[index].name,
                                            type: favouriteRockets[index].type,
                                            active: favouriteRockets[index].active,
                                            stages: favouriteRockets[index].stages,
                                            boosters:
                                            favouriteRockets[index].boosters,
                                            costPerLaunch:
                                            favouriteRockets[index].costPerLaunch,
                                            successRatePct: favouriteRockets[index]
                                                .successRatePct,
                                            firstFlight:
                                            favouriteRockets[index].firstFlight,
                                            country: favouriteRockets[index].country,
                                            company: favouriteRockets[index].company,
                                            wikipedia:
                                            favouriteRockets[index].wikipedia,
                                            description:
                                            favouriteRockets[index].description,
                                            id: favouriteRockets[index].id,
                                            isFavourite:
                                            favouriteRockets[index].isFavourite ==
                                                1
                                                ? 0
                                                : 1));
                                        /// ---- After update the data to local db we need to get the updated data ---- ///
                                        getFavouriteRockets();
                                      });



                                    },
                                    child: Icon(
                                      Icons.star,
                                      color:
                                      favouriteRockets[index].isFavourite == 1
                                          ? Colors.amber
                                          : Colors.grey,
                                    ))

                              ],
                            ),
                          ),
                        ),

                      ],
                    ) ;
                  }),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
