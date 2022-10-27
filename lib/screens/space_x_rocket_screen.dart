import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SpaceXRocket extends StatefulWidget {
  @override
  _SpaceXRocketState createState() => _SpaceXRocketState();
}

class _SpaceXRocketState extends State<SpaceXRocket> with AutomaticKeepAliveClientMixin<SpaceXRocket> {
  @override
  void initState() {
    super.initState();
    print('initState SpaceXRocket');
  }
    void getHttp(context) async {
  try {
    var response = await Dio().get('https://api.spacexdata.com/v4/rockets');
    List data =response.data;
    print(data.runtimeType);
    print(data.length);
    print(data[0]);
    print(data[0].runtimeType);
    Map<String,dynamic> data1 = data[0] as Map<String,dynamic>;
    print(data1.keys.length);
    Navigator.pop(context);
  } on DioError catch (e){
    print(e);
    Navigator.pop(context);
  }
}
  @override
  Widget build(BuildContext context) {
    print('build SpaceXRocket');
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceXRocket'),
      ),
      body: Center(
        child: Text(
          'This is content of SpaceXRocket',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
