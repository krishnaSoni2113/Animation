import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

double objectSize = 100.0;
double zoomScale = 1.0;
double previousZoomScale = 1.0;
double screenWidth = window.physicalSize.width / window.devicePixelRatio;
double screenHeight = window.physicalSize.height / window.devicePixelRatio;

class ZoomViewController extends StatefulWidget {
  @override
  ZoomViewState createState() {
    return ZoomViewState();
  }
}

class ZoomViewState extends State<ZoomViewController>
    with TickerProviderStateMixin {


  @override
  void initState() {
    // TODO: implement initState
    zoomScale = 1.0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Container container = Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.yellow,
      child: Stack(
        children: <Widget>[zoomObject()],
      ),
    );

    return Scaffold(body: container, appBar: AppBar(title: Text("Zoom")),);
  }

  Widget zoomObject() {
    return GestureDetector(

      onScaleStart: (data) {
        previousZoomScale = zoomScale;
      },

      onScaleEnd: (data) {
        previousZoomScale = 0.0;
      },

      onScaleUpdate: (data) {
        setState(() {
          zoomScale = previousZoomScale * data.scale;
          if (zoomScale > 6.0) // Set max zoom scale here....
            zoomScale = 6.0;
          else if (zoomScale < 0.30)
            zoomScale = 0.30;
        });
      },
      
      child: Center(
        child: Transform.scale(
          scale: zoomScale,
          child: Container(
            height: objectSize,
            width: objectSize,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
