import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

import '../../../src/shared/models/work_model.dart';

class WorkCard extends StatelessWidget {
  final WorkModel _work;

  WorkCard(this._work);

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _targetWidth =
        _deviceWidth > 600.0 ? 320.0 : _deviceWidth * 0.80;

    _category() {
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 120.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          padding: EdgeInsets.all(6.0),
          child: Text(
            _work.category,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      );
    }

    _body() {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: 200.0,
          width: double.infinity,
          color: Colors.black.withOpacity(0.6),
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                _work.title,
                style: TextStyle(
                  fontSize: 24.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: Text(
                  _work.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _category(),
            ],
          ),
        ),
      );
    }

    _inkWell() {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: Colors.white.withOpacity(0.1),
          child: Container(),
          onTap: () {
            _launchURL(_work.link);
          },
        ),
      );
    }

    return Container(
      width: _targetWidth,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/${_work.image}'),
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          //_category(),
          _body(),
          _inkWell(),
        ],
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
