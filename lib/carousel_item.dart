import 'package:flutter/material.dart';

class CarouselPlantItem extends StatelessWidget{
  final String name;
  final String photo;
  final String tasks;
  final String room;
  const CarouselPlantItem({
    super.key,
    required this.name,
    required this.photo,
    required this.tasks,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width - 50,
      height: 200,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Stack(
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: Text(name)),
            ),
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                    width: 100,
                    height: 120,
                    child: Image.asset('assets/$photo'))
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Text(room),
                    ),
                    Container(
                      margin: const EdgeInsets.all(1.0),
                      child: Column(
                        children: tasks.split(",").map((e) =>
                            TextButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent),
                              ),
                              onPressed: () {
                                print("task $e completed");
                              },
                              child: Text(e, style: TextStyle(color: Colors.white),),
                            )
                        ).toList(),
                      ),
                    ),
                  ]
              ),
            )
          ]
      ),
    );
  }
}

class CarouselRoomItem extends StatelessWidget{
  final String name;
  final String temp;
  final String humidity;
  final String o2;
  final String tasks;
  final String plantcount;
  final String happy;
  const CarouselRoomItem({
    super.key,
    required this.name,
    required this.temp,
    required this.humidity,
    required this.o2,
    required this.tasks,
    required this.plantcount,
    required this.happy
  });

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width - 50,
      height: 200,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.all(5.0),
                  child: Text(name)
                ),
                Row(
                  children: <Widget> [
                    const Icon(Icons.thermostat),
                    Text("$temp C°"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.water_drop_outlined),
                    Text("$humidity%"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.air),
                    Text("$o2%"),
                  ],
                ),
                Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(5.0),
                    child: const Text("Plant happiness: ")
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.health_and_safety_outlined),
                    Text("$happy%", style: const TextStyle(fontSize: 25)),
                  ],
                ),
              ]
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child:Text("Plants: $plantcount"))
              ] + (tasks.split(",").map((e) =>
                  TextButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent),
                    ),
                    onPressed: () {
                      print("task $e completed");
                    },
                    child: Text(e, style: const TextStyle(color: Colors.white),),
                  )
              ).toList())
            ),
          )
        ]
      ),
    );
  }
}