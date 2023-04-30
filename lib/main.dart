import 'package:flutter/material.dart';
import './query.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlantCare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'PlantCare'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.picture_in_picture),
        title: Text(title),
        automaticallyImplyLeading: false,
        actions: <Widget> [
          IconButton(
            onPressed: (){},
            tooltip: 'Settings',
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: (){},
            tooltip: 'Personal Account',
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery. of(context). size. width - 50,
              height: 220,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:Colors.blueAccent),
                  color: Colors.grey,
                ),
                child: const CurrentTasks()
                ),
              ),
          ],
        ),
      ),
    );
  }
}
