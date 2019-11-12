import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';

class ProfileBox extends StatelessWidget {
  final GlobalKey _profileKey;

  ProfileBox(this._profileKey);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    final _isProfileAnimationStarted = _bloc.isProfileAnimationStarted;
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _targetWidth =
        _deviceWidth > 900.0 ? 900.0 : _deviceWidth * 0.95;

    _title() {
      return Text(
        'Who I\'m',
        style: TextStyle(
          fontSize: 40.0,
        ),
      );
    }

    _body() {
      return Container(
        width: _targetWidth,
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse in varius lacus, tincidunt euismod massa. Donec consectetur justo nec ligula imperdiet, eu elementum augue pellentesque. Sed fringilla luctus ipsum eget posuere. Nulla sit amet dui ac elit dignissim malesuada. Morbi cursus, tellus consequat malesuada faucibus, augue metus sollicitudin orci, sed gravida metus enim sed nunc. Donec lacus nulla, commodo finibus ipsum et, auctor molestie nisi. Donec rutrum id diam ac volutpat. Nulla hendrerit magna in massa imperdiet feugiat. Nulla odio lacus, sollicitudin sit amet dui ac, mollis eleifend mi.',
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 1.0,
            wordSpacing: 1.0,
          ),
        ),
      );
    }

    return AnimatedOpacity(
      key: _profileKey,
      duration: Duration(seconds: 1),
      opacity: _isProfileAnimationStarted ? 1.0 : 0.0,
      child: Container(
        width: _deviceWidth,
        color: Colors.black.withOpacity(0.4),
        margin: EdgeInsets.only(top: 130.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
        child: Column(
          children: <Widget>[
            _title(),
            Divider(),
            SizedBox(
              height: 40.0,
            ),
            _body(),
          ],
        ),
      ),
    );
  }
}
