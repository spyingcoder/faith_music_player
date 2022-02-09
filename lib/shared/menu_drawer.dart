import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.brown[100],
            ),
            child: const Text(
              'Faith Music Player',
            ),
          ),
          ListTile(
            title: const Text('Music Player'),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.pushNamed(context, '/musicScreen');
            },
          ),
          ListTile(
            title: const Text('Camera'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/cameraScreen');
            },
          ),
        ],
      ),
    );
  }
}
