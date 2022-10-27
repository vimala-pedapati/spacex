import 'package:flutter/material.dart';

class FavouriteRockets extends StatefulWidget {
  @override
  _FavouriteRocketsState createState() => _FavouriteRocketsState();
}

class _FavouriteRocketsState extends State<FavouriteRockets> with AutomaticKeepAliveClientMixin<FavouriteRockets> {
  @override
  void initState() {
    super.initState();
    print('initState FavouriteRockets');
  }

  @override
  Widget build(BuildContext context) {
    print('build FavouriteRockets');
    return Scaffold(
      appBar: AppBar(
        title: Text('FavouriteRockets'),
      ),
      body: Center(
        child: Text(
          'This is content of FavouriteRockets',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
