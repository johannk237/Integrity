import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Johann Kengne"),
            accountEmail: Text("Etudiant à SJD"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white54,
              child: ClipOval(
                child: Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.save, color: Colors.blue,),
            title: const Text("Save File",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.compare, color: Colors.blue,),
            title: const Text("Compare Files",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.list, color: Colors.blue,),
            title: const Text("List of Saved Files",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            onTap: () => null,
          ),
          const Divider(),

        ],
      ),
    );
  }
}
