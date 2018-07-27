# flutter_animations

Flutter basic animation application.

## OverView

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

  
