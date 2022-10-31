import 'package:flutter/material.dart';
import 'screens/space_x_rocket_screen.dart';
import 'screens/favourite_rockets_screen.dart';
import 'screens/upcoming_launches_screen.dart';

class TabContainer extends StatefulWidget {
  const TabContainer({Key? key}) : super(key: key);

  @override
  _TabContainerState createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  List<Widget>? originalList;
  Map<int, bool>? originalDic;
  List<Widget>? listScreens;
  List<int>? listScreensIndex;

  int tabIndex = 0;
  Color tabColor = Colors.white;
  Color selectedTabColor = Colors.grey.shade300;

  @override
  void initState() {
    print("Init calling.......[BLUE]");
    super.initState();
    originalList = [
    SpaceXRocket(),
    FavouriteRockets(),
    UpcomingLaunches(),
    ];
    originalDic = {0: true, 1: false, 2: false};
    listScreens = [originalList!.first];
    listScreensIndex = [0];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
            index: listScreensIndex!.indexOf(tabIndex), children: listScreens!),
        bottomNavigationBar: _buildTabBar(),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _selectedTab(int index) {
    if (originalDic![index] == false) {
      listScreensIndex!.add(index);
      originalDic![index] = true;
      listScreensIndex!.sort();
      listScreens = listScreensIndex!.map((index) {
        return originalList![index];
      }).toList();
    }

    setState(() {
      tabIndex = index;
    });
  }

  Widget _buildTabBar() {
    var listItems = [
      BottomAppBarItem(iconData: Icons.home, text: 'Space X Rocket'),
      BottomAppBarItem(iconData: Icons.report_problem, text: 'Favourite Rockets'),
      BottomAppBarItem(iconData: Icons.settings, text: 'Up Coming Launches'),
    ];

    var items = List.generate(listItems.length, (int index) {
      return _buildTabItem(
        item: listItems[index],
        index: index,
        onPressed: _selectedTab,
      );
    });

    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildTabItem({
    BottomAppBarItem? item,
    int? index,
    ValueChanged<int>? onPressed,
  }) {
    var color = tabIndex == index ? selectedTabColor : tabColor;
    return Expanded(
      child: SizedBox(
        height: 60,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed!(index!),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item!.iconData, color: color, size: 24),
                SizedBox(height: 5,),
                Text(
                  item.text,
                  style: TextStyle(color: color, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomAppBarItem {
  BottomAppBarItem({required this.iconData, required this.text});
  IconData iconData;
  String text;
}
