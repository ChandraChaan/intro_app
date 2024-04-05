import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Hello World!'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Hello World!'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Hello World!'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Hello World!'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Hello World!'),
                ),
              ],
            ),
            Container(
              height:50, width:150,child: Text('Hello World!'), color: Colors.amberAccent,),
            Text('Hello World!'),
            Text('Hello World!'),
            Text('Hello World!'),
          ],
        ),
      ),
    );
  }
}

