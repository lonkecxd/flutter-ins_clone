import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ins_clone/insta_body.dart';

class MyInsHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new ScrollableAppBar(),
      body: new InstaBody(),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 50.0,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.add_box),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.account_box),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollableAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _ScrollableAppBarState createState() => new _ScrollableAppBarState();

  // TODO: implement preferredSize
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight );
}

// ignore: conflicting_generic_interfaces
class _ScrollableAppBarState extends State<ScrollableAppBar> with SingleTickerProviderStateMixin {
  double scrollPercent = 0.0;
  Offset startDrag;
  double startDragPercentScroll;
  double finishScrollStart;
  double finishScrollEnd;
  AnimationController finishScrollController;

  @override
  void initState() {
    super.initState();
    finishScrollController = new AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    )
      ..addListener((){
        setState(() {
          scrollPercent = lerpDouble(finishScrollStart,finishScrollEnd,finishScrollController.value);
        });
      });
  }

  @override
  void dispose() {
    finishScrollController.dispose();
    super.dispose();
  }

  Widget _buildAppBar(int cardIndex, int cardCount, double scrollPercent, barTitle,Icon leftIcon,Icon rightIcon) {
    final cardScrollPercent = scrollPercent / (1 / cardCount);

    return new FractionalTranslation(
      translation: Offset(cardIndex - cardScrollPercent, 0.0),
      child: MyAppBar(
        barTitle: barTitle,
        leftIcon: leftIcon,
        rightIcon: rightIcon,
      ),
    );
  }

  List<Widget> _buildAppBars() {
    return [
      _buildAppBar(0, 3, scrollPercent,new Image.asset('assets/images/insta_logo.png'),Icon(Icons.camera_alt),Icon(Icons.send)),
      _buildAppBar(1, 3, scrollPercent,Text('sheldon chen',textAlign: TextAlign.center,),Icon(Icons.camera_alt),Icon(Icons.send)),
      _buildAppBar(2, 3, scrollPercent,Text('photos',textAlign: TextAlign.center,),Icon(Icons.camera_alt),Icon(Icons.send)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: new Stack(
        children: _buildAppBars(),
      ),
    );
  }


  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final currDrag = details.globalPosition;
    final dragDistance = currDrag.dx - startDrag.dx;
    final singlwCardDragPercent = dragDistance / context.size.width;

    final numCards = 3;
    setState(() {
      scrollPercent =
          (startDragPercentScroll + (-singlwCardDragPercent / numCards))
              .clamp(0.0, 1.0 - (1 / numCards));
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final numCards = 3;
    finishScrollStart = scrollPercent;
    finishScrollEnd = (scrollPercent*numCards).round()/numCards;
    finishScrollController.forward(from: 0.0);
    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
    });
  }
}

class MyAppBar extends StatelessWidget {

  dynamic barTitle;
  Icon leftIcon;
  Icon rightIcon;


  MyAppBar({this.barTitle, this.leftIcon, this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: 200.0,
      child: new AppBar(
        backgroundColor: Color(0xfff8faf8),
        centerTitle: true,
        elevation: 1.0,
        leading: leftIcon,
        title: SizedBox(
          height: 35.0,
          child: Center(
            child: barTitle,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: rightIcon,
          )
        ],
      ),
    );
  }
}
