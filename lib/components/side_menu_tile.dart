import 'package:flutter/material.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key, required this.menu, required this.press, required this.submenu
  });

  final String menu;
  final String submenu;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
              height: 60,
              width: 288,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              )),
            ListTile(
              onTap: press,
              leading: const Icon(Icons.list, color: Colors.blue),
              title:  Text(menu,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
              subtitle: Text(submenu,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                ),),
            ),
          ],
        ),
      ],
    );
  }
}

