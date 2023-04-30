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
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery. of(context). size. width - 50,
      height: 200,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent),
        color: Colors.grey,
      ),
      child: Stack(
        children:<Widget>[
          Align(
            alignment: AlignmentDirectional.topStart,
            child:Container(
                margin: const EdgeInsets.all(5.0),
                child:Text(name)) ,
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
                  child:Text(room),
                ),
                Container(
                  margin: const EdgeInsets.all(1.0),
                  child: Column(
                    children: tasks.split(",").map((e) =>
                        TextButton(
                          onPressed: (){print("task $e completed");},
                          child: Text(e),
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

  int multiply(){
    return 1;
  }


}