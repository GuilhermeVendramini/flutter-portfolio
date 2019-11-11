import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'app_bloc.dart';
import 'app_theme.dart';
import 'shared/widgets/background_image.dart';
import 'shared/widgets/default_appbar.dart';
import 'shared/widgets/default_drawer.dart';
import 'shared/widgets/gradient_box.dart';
import 'shared/widgets/introduction_box.dart';
import 'shared/widgets/profile_box.dart';
import 'shared/widgets/social_box.dart';
import 'shared/widgets/work_box.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      title: 'Portfolio',
      home: Stack(
        children: <Widget>[
          BackgroundImage(),
          PageContent(),
        ],
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    final _isIntroAnimationStarted = _bloc.isIntroAnimationStarted;
    final _showProfileBox = _bloc.showProfileBox;

    return Container(
      decoration: GradientBox.boxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: DefaultDrawer(),
        appBar: DefaultAppBar.appBar(),
        body: SafeArea(
          child: AnimatedContainer(
            alignment: _isIntroAnimationStarted
                ? Alignment.topCenter
                : Alignment.bottomCenter,
            duration: Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    IntroductionBox(),
                    _showProfileBox ? ProfileBox() : Container(),
                    _showProfileBox ? WorkBox() : Container(),
                    _showProfileBox ? SocialBox() : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
