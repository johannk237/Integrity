import 'dart:math';

import 'package:flutter/material.dart';
import 'package:integrity/components/side_menu.dart';
import 'package:integrity/home.dart';

import 'models/menu_btn.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  bool isSideMenuClosed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17203A),
      body: Stack(
        children: [
          Positioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu()
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(isSideMenuClosed ? 0 :1 - 30 * pi / 180),
            child: Transform.translate(
              offset: Offset(isSideMenuClosed ? 0 : 265, 0),
                child: Transform.scale(
                  scale: isSideMenuClosed ? 1 : 0.8,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                      child: MyHomePage(title: "Integrity")
                  )
                )
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(microseconds: 200),
            left: isSideMenuClosed ? 0 : 235,
            top: 16,
            child: MenuBtn(press: () { setState(() {
              isSideMenuClosed = !isSideMenuClosed;
            }); },),
          )
        ],
      ),
    );
  }
}

