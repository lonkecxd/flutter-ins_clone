import 'package:flutter/material.dart';

class InstaStories extends StatelessWidget {

  final topText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text('Stories', style: TextStyle(
        fontWeight: FontWeight.bold,
      ),),
      Row(
        children: <Widget>[
          Icon(Icons.play_arrow),
          Text('Watch All', style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      )
    ],
  );

  final stories = Expanded(
    child: new Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, index) =>
        new Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Container(
              width: 60.0,
              height: 60.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(fit:BoxFit.fill,image: new AssetImage('assets/images/user.jpg'),)
              ),
              margin:const EdgeInsets.symmetric(horizontal: 8.0),
            ),
            index==0?Positioned(
              right: 10.0,
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 10.0,
                child: Icon(Icons.add,size: 14.0,color: Colors.white,),
              ),
            ):new Container()
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          topText,
          stories,
        ],
      ),
    );
  }
}
