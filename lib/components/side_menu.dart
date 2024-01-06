import 'package:flutter/material.dart';

import 'info_card.dart';
import 'side_menu_tile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            children: [
              const InfoCard(name: 'PROF BELL BITJOKA', profession: 'Cryptologue',),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 16, bottom: 16),
                child: Text("BROWSE",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white70),
                ),
              ),
              SideMenuTile(
                menu: 'Save File',
                press: () {  },
                submenu: '',
              ),
              SideMenuTile(
                menu: 'Compare File',
                press: () {  },
                submenu: '',
              ),
              SideMenuTile(
                menu: 'List of Saved File',
                press: () {  },
                submenu: '',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 10, bottom: 16),
                child: Text("GROUP MEMBERS",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white70),
                ),
              ),
              SideMenuTile(
                menu: 'Kengne Johann',
                press: () {  },
                submenu: 'GIT5-SE',
              ),
              SideMenuTile(
                menu: 'Koguem Durand',
                press: () {  },
                submenu: 'GIT5-RT',
              ),
              SideMenuTile(
                menu: 'Ketchouang Yann',
                press: () {  },
                submenu: 'GIT5-RT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

