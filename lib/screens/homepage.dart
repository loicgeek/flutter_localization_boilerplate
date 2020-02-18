import 'package:flutter/material.dart';
import 'package:flutter_localization/screens/settings.dart';
import 'package:flutter_localization/translation/global_translation.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = "HomePage";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.text('pageNames.home')),
      ),
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: Container(
                color: Colors.green,
              )),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
            leading: Icon(Icons.settings),
            title: Text(translations.text('pageNames.settings'),
                style: TextStyle(
                  fontSize: 17,
                )),
          ),
          Divider(),
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              translations.text('pages.home.welcome',
                  params: {"name": "loic", 'lastname': "ngou"}),
            ),
            Text(
              translations.text('pages.home.label_times'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
