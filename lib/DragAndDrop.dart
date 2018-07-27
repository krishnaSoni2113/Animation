import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

double objectSize = 100.0;


double screenWidth = window.physicalSize.width / window.devicePixelRatio;
double screenHeight = window.physicalSize.height / window.devicePixelRatio;

double dragPositionY = screenHeight/2 - objectSize/2;
double dragPositionX = screenWidth/2 - objectSize/2;


class DragAndDrop extends StatefulWidget
{
  @override
  DragAndDropState createState(){
    return DragAndDropState();
  }

}

class DragAndDropState extends State<DragAndDrop> with TickerProviderStateMixin
{
  @override
  Widget build(BuildContext context) {


    Container container = Container(
      color: Colors.yellow,
      height: screenHeight,
      width: screenWidth,
      child: new Stack(
        children: <Widget>[dragDropObject()],
      ),
    );

    return Scaffold(body: container,);
  }

  Widget dragDropObject(){

    return new GestureDetector(

      onScaleUpdate: (data) {
        setState(() {
          dragPositionX = data.focalPoint.dx - objectSize/2;
          dragPositionY = data.focalPoint.dy - objectSize/2;

          if (dragPositionX <= 0){
            dragPositionX = 0.0;
          } else if (dragPositionX + objectSize > screenWidth){
            dragPositionX = screenWidth - objectSize;
          }

          if (dragPositionY <= 0){
            dragPositionY = 0.0;
          } else if (dragPositionY + objectSize> screenHeight){
            dragPositionY = screenHeight - objectSize;
          }
        });
      },


      child: Padding(
        padding: EdgeInsets.only(top: dragPositionY, left: dragPositionX),
        child: Container(
          color: Colors.red,
          height: objectSize,
          width: objectSize,
        ),

      ),
    );

  }

}