import 'package:flutter/material.dart';
import 'package:integrity/screens/compare_file.dart';
import 'package:integrity/screens/list_saved_file.dart';
import 'package:integrity/screens/save_file.dart';

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
    return Drawer(
      child: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                  press: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return const SaveFile();}));
                    },
                  submenu: '',
                ),
                SideMenuTile(
                  menu: 'Compare Files',
                  press: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return const CompareFile();
                  })); },
                  submenu: '',
                ),
                SideMenuTile(
                  menu: 'List of Saved Files',
                  press: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return const ListSavedFile();
                  })); },
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
      ),
    );
  }
}

