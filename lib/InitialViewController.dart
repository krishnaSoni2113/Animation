
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'DragAndDrop.dart';
import 'ZoomViewController.dart';

double screenWidth = window.physicalSize.width / window.devicePixelRatio;
double screenHeight = window.physicalSize.height / window.devicePixelRatio;

class InitialViewController extends StatefulWidget{

  @override
  InitialViewState createState(){
    return InitialViewState();
  }
}

class InitialViewState extends State<InitialViewController> with TickerProviderStateMixin
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    MaterialButton btnDragAndDrop = MaterialButton(
        height: 50.0,
        minWidth: screenWidth,
        color: Colors.white,
        child: Text("Drag And Drop"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DragAndDrop()));
        }

    );

    MaterialButton btnZoom = MaterialButton(
        height: 50.0,
        minWidth: screenWidth,
        color: Colors.white,
        child: Text("Zoom"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ZoomViewController()));
        }

    );

    Container container = Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.black,
      child: Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(right: 50.0, left: 50.0, top: 50.0),
            child: btnDragAndDrop,
          ),

          new Padding(
            padding: EdgeInsets.only(right: 50.0, left: 50.0, top: 50.0),
            child: btnZoom,
          )

        ],
      ),
    );

    return Scaffold(body: container);
  }

}