import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';

class DefaultDrawer extends StatefulWidget {
  final ScrollController _controller;
  final List<GlobalKey> _key;

  DefaultDrawer(this._controller, this._key);

  @override
  _DefaultDrawerState createState() => _DefaultDrawerState();
}

class _DefaultDrawerState extends State<DefaultDrawer> {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);

    final TextStyle _textStyle = TextStyle(
      fontSize: 20.0,
      color: Colors.black,
    );

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            title: Text(
              'Who I\'m',
              style: _textStyle,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              if (_bloc.isProfileAnimationStarted)
                _jumpTo(context, widget._key[0]);
            },
          ),
          ListTile(
            title: Text(
              'Work',
              style: _textStyle,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              if (_bloc.isProfileAnimationStarted)
                _jumpTo(context, widget._key[1]);
            },
          ),
          ListTile(
            title: Text(
              'Social',
              style: _textStyle,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              if (_bloc.isProfileAnimationStarted)
                _jumpTo(context, widget._key[2]);
            },
          ),
        ],
      ),
    );
  }

  void _jumpTo(BuildContext context, GlobalKey key) {
    RenderBox box = key.currentContext.findRenderObject();
    Offset _position =
        box.localToGlobal(Offset(0.0, widget._controller.offset));
    widget._controller.animateTo(_position.dy,
        duration: Duration(seconds: 1), curve: Curves.easeOut);
    Navigator.pop(context);
  }
}
