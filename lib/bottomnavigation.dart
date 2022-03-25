import 'package:flutter/material.dart';
import 'package:netflix/UI/Fastlaughs.dart';
import 'package:netflix/UI/Homes.dart';
import 'package:netflix/UI/downloads.dart';
import 'package:netflix/UI/new&hot.dart';
import 'package:netflix/UI/search.dart';
import 'package:netflix/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final screens = [
    const Home(),
    const NewHot(),
    const FastLaughs(),
    const Search(),
    const Downloads()
  ];
  // MenuItem currentItem = MenuItems.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: backgroundcolor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 8,
          unselectedFontSize: 8,
          iconSize: 28,
          currentIndex: currentIndex,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections_outlined), label: "New & Hot"),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_outlined),
                label: "Fast Laughs"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.download_for_offline_outlined),
                label: "Downloads")
          ],
        ));
  }
}
