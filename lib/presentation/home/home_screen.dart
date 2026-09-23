import 'package:evently/common/enums/categories_enum.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/presentation/home/tabs/fav_tab/fav_tab.dart';
import 'package:evently/presentation/home/tabs/home_tab/home_tab.dart';
import 'package:evently/presentation/home/tabs/maps_tab/maps_tab.dart';
import 'package:evently/presentation/home/tabs/profile_tab/profile_tab.dart';
import 'package:evently/presentation/home/widgets/event_card.dart';
import 'package:evently/presentation/home/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currantTabIndex = 0;
  List<Widget> tabs = [HomeTab(), MapsTab(), FavTab(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(),
      body: tabs[currantTabIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,

        backgroundColor: Theme.of(context).cardColor,
        onPressed: () {},
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 5)),
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: currantTabIndex,
        onTap: (value) {
          setState(() {
            currantTabIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon: Icon(Icons.location_on),
            label: "map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: "fav",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            activeIcon: Icon(Icons.person_2),
            label: "map",
          ),
        ],
      ),
    );
  }
}
//shared prefrance || cashing 
//firebase 