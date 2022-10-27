import 'package:flutter/material.dart';

class UpcomingLaunches extends StatefulWidget {
  @override
  _UpcomingLaunchesState createState() => _UpcomingLaunchesState();
}

class _UpcomingLaunchesState extends State<UpcomingLaunches> with AutomaticKeepAliveClientMixin<UpcomingLaunches> {
  @override
  void initState() {
    super.initState();
    print('initState UpcomingLaunches');
  }

  @override
  Widget build(BuildContext context) {
    print('build UpcomingLaunches');
    return Scaffold(
      appBar: AppBar(
        title: Text('UpcomingLaunches'),
      ),
      body: Center(
        child: Text(
          'This is content of UpcomingLaunches',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
