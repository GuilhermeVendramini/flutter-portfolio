import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app_theme.dart';
import 'shared/widgets/background_image.dart';
import 'shared/widgets/box_gradient.dart';
import 'shared/widgets/default_appbar.dart';
import 'shared/widgets/default_drawer.dart';
import 'shared/widgets/introduction_box.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      title: 'Portfolio',
      home: Stack(
        children: <Widget>[
          BackgroundImage(),
          Container(
            decoration: BoxGradient.boxDecoration(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              drawer: DefaultDrawer(),
              appBar: DefaultAppBar.appBar(),
              body: SafeArea(
                child: IntroductionBox(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
