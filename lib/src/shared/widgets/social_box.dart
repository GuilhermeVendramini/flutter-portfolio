import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

import '../../app_bloc.dart';

class SocialBox extends StatelessWidget {
  final GlobalKey _socialKey;

  SocialBox(this._socialKey);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    final _isProfileAnimationStarted = _bloc.isProfileAnimationStarted;
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _targetWidth =
        _deviceWidth > 900.0 ? 900.0 : _deviceWidth * 0.95;

    _title() {
      return Text(
        'Social',
        style: TextStyle(
          fontSize: 40.0,
        ),
      );
    }

    _body() {
      final double _socialIconHeight = 30.0;

      return Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 36.0,
        spacing: 36.0,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _launchURL('https://github.com/GuilhermeVendramini');
            },
            child: Image.asset(
              'assets/images/github.png',
              height: _socialIconHeight,
            ),
          ),
          GestureDetector(
            onTap: () {
              _launchURL('https://www.linkedin.com/in/guilhermevendramini');
            },
            child: Image.asset(
              'assets/images/linkedin.png',
              height: _socialIconHeight,
            ),
          ),
          GestureDetector(
            onTap: () {
              _launchURL('https://www.instagram.com/guilherme.vendramini');
            },
            child: Image.asset(
              'assets/images/instagram.png',
              height: _socialIconHeight,
            ),
          ),
          kIsWeb
              ? Container()
              : GestureDetector(
                  onTap: () {
                    _launchURL('tel:+55 11 942527337');
                  },
                  child: Image.asset(
                    'assets/images/whatsapp.png',
                    height: _socialIconHeight,
                  ),
                ),
        ],
      );
    }

    _email() {
      return Text(
        'guilhermevendramini@hotmail.com',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      );
    }

    _emailMobile() {
      return GestureDetector(
        onTap: () {
          _launchURL('mailto:guilhermevendramini@hotmail.com');
        },
        child: _email(),
      );
    }

    _emailAndPhoneWeb() {
      return Column(
        children: <Widget>[
          _email(),
          Text('+55 11 942527337'),
        ],
      );
    }

    return AnimatedOpacity(
      key: _socialKey,
      duration: Duration(seconds: 1),
      opacity: _isProfileAnimationStarted ? 1.0 : 0.0,
      child: Container(
        color: Colors.transparent,
        width: _targetWidth,
        margin: EdgeInsets.only(top: 80.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _title(),
            Divider(),
            SizedBox(
              height: 40.0,
            ),
            _body(),
            SizedBox(
              height: 100.0,
            ),
            kIsWeb ? _emailAndPhoneWeb() : _emailMobile(),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Made with Flutter',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (kIsWeb) {
      html.window.open(url, '');
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
