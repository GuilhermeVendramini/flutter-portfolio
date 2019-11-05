import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  final _textColor = Colors.white;

  final _textStyle = TextStyle(
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'FuturaPT',
        primarySwatch: Colors.grey,
        canvasColor: Colors.black.withOpacity(0.6),
        hoverColor: Colors.grey.withOpacity(0.4),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          headline: _textStyle,
          subtitle: _textStyle,
          title: _textStyle,
          body1: _textStyle,
          body2: _textStyle,
          subhead: _textStyle,
        ),
      ),
      title: 'Portfolio',
      home: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          backgroundBlendMode: BlendMode.overlay,
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Who I\'m',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        'Work',
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: _textColor,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              'Guilherme Vendramini',
              style: TextStyle(color: _textColor),
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Text('Building Apps and Websites with excellence', style: TextStyle(
                  fontSize: 38.0,
                ),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
