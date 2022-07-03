import 'package:flutter/material.dart';
import './bottomNavWidgets/add_post.dart';
import './bottomNavWidgets/home.dart';
import './bottomNavWidgets/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int screenIndex = 0;
  List<Widget> bottomNavScreens = [
    const AddPost(),
    const Home(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: bottomNavScreens[screenIndex]),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(indicatorColor: Colors.grey[350]),
        child: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              screenIndex = value;
            });
          },
          selectedIndex: screenIndex,
          height: 60,
          backgroundColor: Colors.grey[350],
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.add_circle,
                  color: Colors.grey[700],
                  size: 35,
                ),
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 35,
                ),
                label: 'Add Post'),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  color: Colors.grey[700],
                  size: 35,
                ),
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 35,
                ),
                label: 'Home'),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.person,
                  color: Colors.grey[700],
                  size: 35,
                ),
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 35,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
