import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../src/data/works_data.dart';
import '../../../src/shared/widgets/work_card.dart';
import '../../app_bloc.dart';

class WorkBox extends StatelessWidget {
  final GlobalKey _workKey;

  WorkBox(this._workKey);

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
      key: _workKey,
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
    return Container(
      height: 500.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: worksData.length,
        itemBuilder: (BuildContext context, int index) {
          return WorkCard(worksData[index]);
        },
      ),
    );
  }
}
