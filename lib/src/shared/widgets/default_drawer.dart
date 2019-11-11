import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(
      fontSize: 20.0,
      color: Colors.black,
    );

    return Drawer(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                key: Key('im'),
                title: Text(
                  'Who I\'m',
                  style: _textStyle,
                  textAlign: TextAlign.center,
                ),
                onTap: () {},
              ),
              ListTile(
                key: Key('work'),
                title: Text(
                  'Work',
                  style: _textStyle,
                  textAlign: TextAlign.center,
                ),
                onTap: () {},
              ),
              ListTile(
                key: Key('social'),
                title: Text(
                  'Social',
                  style: _textStyle,
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
