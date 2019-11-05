import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Who I\'m',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Work',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}