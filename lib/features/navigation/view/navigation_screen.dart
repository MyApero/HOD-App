import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hod/apis/auth_api.dart';
import 'package:hod/apis/local_api.dart';
import 'package:hod/models/user_model.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key, required this.pages});

  final List<Widget> pages;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  UserModel? user;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<UserModel?> _getExistingUser() async {
    UserModel? user = LocalApi.getCurrentUser();
    if (user == null) {
      return AuthApi.getUser();
    } else {
      return user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getExistingUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData) {
          user = snapshot.data as UserModel;
        }
        return Scaffold(
          body: widget.pages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            iconSize: MediaQuery.of(context).size.height * 4 / 100,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_rounded),
                label: 'Calendar',
              ),
              if (user?.role == Role.admin || user?.role == Role.staff)
                BottomNavigationBarItem(
                  icon: FaIcon(Random().nextInt(5).remainder(5) == 0
                      ? FontAwesomeIcons.shieldCat
                      : FontAwesomeIcons.shieldDog),
                  label: 'Administration',
                ),
              if (user?.role == Role.member)
                const BottomNavigationBarItem(
                  icon: Icon(Icons.poll),
                  label: 'Sondages',
                ),
              const BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.layerGroup),
                label: 'Pôles',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Paramètres',
              ),
            ],
          ),
        );
      },
    );
  }
}
