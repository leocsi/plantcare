import 'package:flutter/material.dart';

class ScreenWidth extends StatelessWidget{
  ScreenWidth({super.key, width = 0.1});
  double? width;

  queryScreen(BuildContext context){
    width = MediaQuery.of(context).size.width;
    return Container();
  }

  @override
  Widget build(BuildContext context){
    return queryScreen(context);
  }
}