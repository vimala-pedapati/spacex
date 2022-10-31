import 'package:flutter/material.dart';

import '../global.dart';
import 'auth_screen.dart';

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
        title: const Text('Upcoming Launches'),
         actions:   [
           IconButton(icon: const Icon(Icons.logout),onPressed: (){
             firebaseAuth.signOut();
             Navigator.pushReplacement( context, MaterialPageRoute(builder:  (context)=> const AuthScreen()));
           },),
          const SizedBox(width: 40,)
        ],
      ),
      body: const Center(
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
