import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';

class ProfileBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    final _isProfileAnimationStarted = _bloc.isProfileAnimationStarted;

    return AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: _isProfileAnimationStarted ? 1.0 : 0.0,
      child: Column(
        children: <Widget>[
          _title(),
          SizedBox(
            height: 10.0,
          ),
          _body(),
        ],
      ),
    );
  }

  _title() {
    return Text(
      'Who I\'m',
      style: TextStyle(
        fontSize: 40.0,
      ),
    );
  }

  _body() {
    return Text('Hi, I\'m Guilherme Vendramini and...');
  }
}
