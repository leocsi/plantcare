import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'dart:async';
import './carousel_item.dart';

Future<String> getCurrentTasks(BuildContext context) async {

  Future<String> loadAsset() async {
    return await DefaultAssetBundle.of(context).loadString('assets/plants.xml');
  }

  final doc = XmlDocument.parse(await loadAsset());
  return doc.toString();
}

class CurrentTasks extends StatelessWidget {
  const CurrentTasks({super.key});

  @override
  Widget build(context){
    return FutureBuilder<String>(
      future: getCurrentTasks(context),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return PageView(
            controller: PageController(
              initialPage: 0,
              keepPage: false,
              viewportFraction: 0.75,
            ),
            children: XmlDocument.parse(snapshot.data!).findAllElements("Plant").map((e) =>
              CarouselPlantItem(
                name: e.getElement("PlantName")!.innerText,
                photo: e.getElement("PlantPhoto")!.innerText,
                tasks: e.findAllElements("TaskName").map((el) => el.innerText).join(","),
                room: e.getElement("RoomID")!.innerText
              )
            ).toList()
          );
        }
        else {
          return PageView(
            controller: PageController(
              initialPage: 0,
              keepPage: false,
              viewportFraction: 0.75,
            ),
            children: const <Widget>[
              CircularProgressIndicator(),
              CircularProgressIndicator()
            ]
          );
        }
      }
    );
  }
}

class CurrentRooms extends StatelessWidget{
  var plantcount;
  CurrentRooms({super.key, this.plantcount = ""});

  Future<String> getCurrentRooms(BuildContext context) async{
    Future<String> loadRooms() async {
      return await DefaultAssetBundle.of(context).loadString('assets/rooms.xml');
    }

    Future <String> loadPlants() async{
      return await DefaultAssetBundle.of(context).loadString('assets/plants.xml');
    }
    
    final plantdoc = XmlDocument.parse(await loadPlants());
    final ids = plantdoc.findAllElements("RoomID");
    Map roomCounts = {};
    for (final el in ids){
      String text = el.innerText;
      if (roomCounts.containsKey(text)){
        roomCounts[text] += 1;
      }
      else{
        roomCounts[text] = 1;
      }
    }
  
    plantcount = roomCounts;
    final doc = XmlDocument.parse(await loadRooms());
    return doc.toString();
  }

  @override
  Widget build(context){
    return FutureBuilder<String>(
        future: getCurrentRooms(context),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return PageView(
                controller: PageController(
                  initialPage: 0,
                  keepPage: false,
                  viewportFraction: 0.75,
                ),
                children: XmlDocument.parse(snapshot.data!).findAllElements("Room").map((e) =>
                    CarouselRoomItem(
                        name: e.getElement("RoomName")!.innerText,
                        temp: e.getElement("RoomTemp")!.innerText,
                        humidity: e.getElement("RoomHumidity")!.innerText,
                        o2: e.getElement("RoomOxygen")!.innerText,
                        tasks: e.findAllElements("TaskName").map((el) => el.innerText).join(","),
                        plantcount: plantcount[(e.getElement("RoomID"))?.innerText] != null ?
                        plantcount[e.getElement("RoomID")!.innerText].toString() : "0",
                        happy: e.getElement("RoomHappy")!.innerText,
                    )
                ).toList()
            );
          }
          else {
            return PageView(
                controller: PageController(
                  initialPage: 0,
                  keepPage: false,
                  viewportFraction: 0.75,
                ),
                children: const <Widget>[
                  CircularProgressIndicator(),
                  CircularProgressIndicator()
                ]
            );
          }
        }
    );
  }
}