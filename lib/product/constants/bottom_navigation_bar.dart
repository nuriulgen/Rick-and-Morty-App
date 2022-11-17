// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_app/ui/home/view/home_detail_view.dart';

import '../../ui/home/view/home_view.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final _pages = [const HomeView(), const HomeDetailView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Card(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          showUnselectedLabels: true,
          onTap: onTapped,
          items: _barItems(),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _barItems() {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: BottomNavItem.Home.name,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.search),
        label: BottomNavItem.Characters.name,
      ),
    ];
  }
}

enum BottomNavItem { Home, Characters }
