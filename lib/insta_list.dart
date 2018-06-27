import 'package:flutter/material.dart';
import 'package:ins_clone/insta_stories.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery
        .of(context)
        .size;

    return new ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, index) =>
      index == 0
          ? new SizedBox(
        child: new InstaStories(),
        height: deviceSize.height * 0.2,
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage('assets/images/user.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('imptf' + index.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                )
              ],
            ),
          ),

          Flexible(
            fit: FlexFit.loose,
            child: new Image.network(
              'https://picsum.photos/400/300?image=' + (858 + index).toString(),
              fit: BoxFit.cover,),
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.heart),
                    SizedBox(width: 16.0,),
                    Icon(FontAwesomeIcons.comment),
                    SizedBox(width: 16.0,),
                    Icon(FontAwesomeIcons.paperPlane),
                  ],
                ),
                Icon(FontAwesomeIcons.bookmark)
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Liked by pawankumar,pk and 521,256 others',
              style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(fit: BoxFit.fill,
                        image: new AssetImage('assets/images/user.jpg')),
                  ),
                ),
                SizedBox(width: 10.0,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add a comment',
                    ),
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('1 Day Ago',style: TextStyle(color: Colors.grey),),
          )
        ],
      ),
    );
  }
}
