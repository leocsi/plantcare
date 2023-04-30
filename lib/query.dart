import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'dart:async';
import './carousel_item.dart';

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
Future<String> getCurrentTasks(BuildContext context) async {

  Future<String> loadAsset() async {
    return await DefaultAssetBundle.of(context).loadString('assets/plants.xml');
  }

  final doc = XmlDocument.parse(await loadAsset());
  return doc.toString();
}
