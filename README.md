# flutter_animations

Flutter basic animation application.

## Overview

- Drag functionality
  - Drag object anywhere in screen by using GestureDetector() widget
  
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

- Zoom functionality
  - Zoom In/Out object by using GestureDetector widget.


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


  
