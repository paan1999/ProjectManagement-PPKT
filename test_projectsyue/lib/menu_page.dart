import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Main Menu'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('DrawerHeader'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                //update the state of app
                //...
                //then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                //update
                //...
                //close drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Tap on that button'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showButtons,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void showButtons() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  createButton(Colors.red, 'red'),
                  createButtonTwo(Colors.yellow, 'yellow'),
                  createButtonThree(Colors.green, 'green')
                ],
              ),
            )
          ],
        );
      }
    );
  }
  
  RaisedButton createButton(Color color, String name) {
    return RaisedButton(
      color: color,
      onPressed: () {
        print('Print' + name);
      },
      textColor: Colors.white,
      child: Center(
        child: Text('Make Application'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

    RaisedButton createButtonTwo(Color color, String name) {
    return RaisedButton(
      color: color,
      onPressed: () {
        print('Print' + name);
      },
      textColor: Colors.white,
      child: Center(
        child: Text('View Result'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

    RaisedButton createButtonThree(Color color, String name) {
    return RaisedButton(
      color: color,
      onPressed: () {
        print('Print' + name);
      },
      textColor: Colors.white,
      child: Center(
        child: Text('Floating button'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}



