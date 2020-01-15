import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

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

    _flags() {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/brazil.png',
            height: 30.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Image.asset(
            'assets/images/italy.png',
            height: 30.0,
          ),
        ],
      );
    }

    _body() {
      return Container(
        width: _targetWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Flutter and Web developer\n\n',
              style: TextStyle(
                fontSize: 22.0,
                letterSpacing: 1.0,
                wordSpacing: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'I\'m currently studying Flutter, with 3 Udemy courses already finished. I have been daily improving my knowledge, creating mobile and web applications  using this amazing technology.',
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 1.0,
                wordSpacing: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Nationalities',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            _flags(),
          ],
        ),
      );
    }

    _avatar() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(90.0),
        child: FadeInImage(
          height: 180.0,
          width: 180.0,
          placeholder: MemoryImage(kTransparentImage),
          image: AssetImage('assets/images/gui.jpg'),
          fit: BoxFit.cover,
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
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
        child: Column(
          children: <Widget>[
            _title(),
            Divider(),
            SizedBox(
              height: 40.0,
            ),
            _avatar(),
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
