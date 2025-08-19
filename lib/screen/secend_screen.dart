import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class SecendScreen extends StatefulWidget {
  const SecendScreen({super.key});

  @override
  State<SecendScreen> createState() => _SecendScreenState();
}

class _SecendScreenState extends State<SecendScreen> {
  GlobalKey _bottomHomeKey = GlobalKey();
  GlobalKey _bottomSearchKey = GlobalKey();
  GlobalKey _bottomMoreKey = GlobalKey();

  List<TargetFocus> targets = [];
  TutorialCoachMark? tutorialCoachMark;

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _targetShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Second Screen Page'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is second screen page',
              key: _bottomHomeKey,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startTargets();
          setState(() {
            _currentIndex = 0;
          });
        },
        key: _bottomMoreKey,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            // key: _bottomHomeKey,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            key: _bottomSearchKey,
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            key: _bottomMoreKey,
            icon: Icon(Icons.more_vert),
            label: 'More',
          ),
        ],
      ),
    );
  }

  void _targetShow() {
    _createTargets();
    _startTargets();
  }

  void _startTargets() {
    tutorialCoachMark = TutorialCoachMark(targets: targets);
    tutorialCoachMark!.show(context: context);
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    if (_currentIndex < targets.length) {
      _timer = Timer(Duration(seconds: 3), () {
        _nextTimer();
      });
    }
  }

  _nextTimer() {
    if (_currentIndex < targets.length - 1) {
      _currentIndex++;
      tutorialCoachMark!.next();
      _startTimer();
    } else {
      tutorialCoachMark!.finish();
    }
  }

  _createTargets() {
    targets.add(
      TargetFocus(
        keyTarget: _bottomHomeKey,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        radius: 10,
        targetPosition: TargetPosition(Size.square(10),  Offset.zero),
        contents: [
          TargetContent(
            padding: EdgeInsets.zero,
            align: ContentAlign.bottom,
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'This is your home feature',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        keyTarget: _bottomSearchKey,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Search',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'This is your Search feature',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        keyTarget: _bottomMoreKey,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.red.withOpacity(0.22),
       paddingFocus:0,
        radius: 10,
        // targetPosition: TargetPosition(Size.square(10),  Offset.zero),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'More',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'This is your More feature',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return targets;
  }
}
