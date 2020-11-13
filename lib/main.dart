import 'package:flutter/material.dart';

import 'package:whiteboardkit/whiteboardkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: <String , WidgetBuilder> {
        '/':(BuildContext context)=>FirstPage(),
        '/MyDrawingPage':(BuildContext context)=>MyDrawingPage(title: 'White Board App')
      }
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('White Board App'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context,'/MyDrawingPage');
              },
              color: Colors.blue,
              child: Text('Lets Draw'),
              textColor: Colors.white
            ),
          ],
        ),
      ),
    );
  }
}

class MyDrawingPage extends StatefulWidget {
  MyDrawingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyDrawingPageState createState() => _MyDrawingPageState();
}

class _MyDrawingPageState extends State<MyDrawingPage> {
  DrawingController controller;

  @override
  void initState() {
    controller = new DrawingController();
    controller.onChange().listen((draw){
      //do something with it
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Back"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: Whiteboard(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}