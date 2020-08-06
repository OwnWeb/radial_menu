import 'package:flutter/material.dart';
import 'package:radial_menu/radial_menu.dart';

void main() {
  runApp(MyApp());
}

const _title = 'Radial Menu Demo';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<RadialMenuEntry> radialMenuEntries = [
    RadialMenuEntry(
        icon: Icons.restaurant, text: 'Restaurant', color: Colors.red),
    RadialMenuEntry(
        icon: Icons.hotel,
        text: 'Hotel',
        iconColor: Colors.lightBlue,
        textColor: Colors.amber),
    RadialMenuEntry(icon: Icons.pool, text: 'Pool', iconSize: 36),
    RadialMenuEntry(icon: Icons.shopping_cart, text: 'Shop'),
  ];

  @override
  Widget build(BuildContext context) {
    double size = 220;
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(_title),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "   Where would you go next?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(height: 10),
              Text("    Click that button to choose now"),
              Container(height: 40),
              Transform.translate(
                  offset: Offset(-size / 2 + 40, 0),
                  child: RadialMenu(
                    size: size,
                    entrySize: 120,
                    entries: radialMenuEntries,
                  ))
            ]));
  }
}
