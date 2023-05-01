import 'package:flutter/material.dart';
import './query.dart';
import './util.dart';

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
      home: const MyHomePage(title: 'PlantCare',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{
  int _currentPage = 0;
  static final List<Widget> _pages = <Widget>[
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.symmetric(vertical: 25),
              width: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width - 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Total devices: 7", style: TextStyle(fontSize: 25),),
                  const Text("Total plant happiness:\n 80.333 %", style: TextStyle(fontSize: 25),),
                  Container(
                      margin: const EdgeInsets.only(bottom: 15)
                  )
                ],
              )
          ),
          Container(
            width: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width - 50,
            margin: const EdgeInsets.only(bottom: 15.0),
            height: 220,
            child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:Colors.blueAccent),
                ),
                child: CurrentRooms()
            ),
          ),
          SizedBox(
            width: MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width - 50,
            height: 220,
            child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:Colors.blueAccent),
                ),
                child: const CurrentTasks()
            ),
          ),
        ],
      ),
    ),
    Container(margin:const EdgeInsets.all(10), alignment: AlignmentDirectional.centerStart,child: const Text("See demo for Rooms Layout"),),
    Container(margin:const EdgeInsets.all(10), alignment: AlignmentDirectional.centerStart,child: const Text("See demo for Plants Layout"),)
  ];

  void _onPageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.picture_in_picture),
        title: const Text("PlantCare"),
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
      body: _pages.elementAt(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.house_outlined),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.airline_seat_flat),
              label: "Rooms"
          ),BottomNavigationBarItem(
              icon: Icon(Icons.nature_outlined),
              label: "Plants"
          )
        ],
        currentIndex: _currentPage,
        onTap: _onPageChange,
      ),
    );
  }
}
