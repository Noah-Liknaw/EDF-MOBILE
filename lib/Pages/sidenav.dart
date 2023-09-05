

import 'package:flutter/material.dart';

class SideNav extends StatefulWidget {
  const SideNav({super.key});

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // do something
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // do something
          },
        ),
      ],
    ),
  ),
  body: const Text("....."),
    );
  }
}