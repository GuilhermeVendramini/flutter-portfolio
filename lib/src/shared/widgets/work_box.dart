import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    final _isProfileAnimationStarted = _bloc.isProfileAnimationStarted;
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _targetWidth =
        _deviceWidth > 900.0 ? 900.0 : _deviceWidth * 0.95;

    _title() {
      return Text(
        'Work',
        style: TextStyle(
          fontSize: 40.0,
        ),
      );
    }

    return AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: _isProfileAnimationStarted ? 1.0 : 0.0,
      child: Container(
        width: _targetWidth,
        margin: EdgeInsets.only(top: 130.0),
        child: Column(
          children: <Widget>[
            _title(),
            Divider(),
            SizedBox(
              height: 40.0,
            ),
            ListWork(),
          ],
        ),
      ),
    );
  }
}

class ListWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _targetWidth =
        _deviceWidth > 650.0 ? 650.0 : _deviceWidth * 0.80;

    return Container(
      height: 400.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: _targetWidth,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            padding: EdgeInsets.all(20.0),
            color: Colors.grey.withOpacity(0.6),
            child: Text(
              'Aenean volutpat varius libero. Pellentesque hendrerit, lacus et faucibus rutrum, elit urna pretium urna, quis hendrerit ante augue quis magna. Donec tempor, nunc quis tristique lobortis, velit purus vehicula dolor, in tristique magna dui eu leo. Etiam non rhoncus enim, at cursus sem. Sed vel justo nec enim tincidunt pretium at at quam. Nulla feugiat ornare commodo.In bibendum, orci non ornare dignissim, mi ex bibendum neque, id interdum erat sapien ac mauris.',
            ),
          );
        },
      ),
    );
  }
}
