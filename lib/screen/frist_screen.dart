import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class FristScreen extends StatefulWidget {
  const FristScreen({super.key});

  @override
  State<FristScreen> createState() => _FristScreenState();
}

class _FristScreenState extends State<FristScreen> {
  GlobalKey _searchKey = GlobalKey();
  GlobalKey _moreKey = GlobalKey();

  List<TargetFocus> targets = [];
  TutorialCoachMark? tutorialCoachMark;

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
      createTargets();
      _showTutorial();

  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('First Screen Page'),
        centerTitle: true,
        actions: [
          IconButton(
            key: _searchKey,
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            key: _moreKey,
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is first screen page',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentIndex =0;
                  });
                  _showTutorial();
                }, child: Text('Go To Second Screen')),
          ],
        ),
      ),
    );
  }

  void _showTutorial() {
    tutorialCoachMark = TutorialCoachMark(targets: targets,onFinish: () {
      _timer?.cancel();
    },);
    tutorialCoachMark!.show(context: context);
    _showTimer();
  }
  _showTimer() {
    _timer?.cancel();
    if(_currentIndex < targets.length){
      _timer = Timer(Duration(seconds: 3), () {
        _nextTimer();
      });
    }
  }
  _nextTimer() {
    if(_currentIndex< targets.length - 1){
      _currentIndex++;
      tutorialCoachMark!.next();
      _showTimer();
    }else{
      tutorialCoachMark!.finish();
    }
  }


  List<TargetFocus> createTargets() {
    targets.add(
      TargetFocus(
        keyTarget: _searchKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
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
              ],
            ),
          ),
        ],
      ),
    );
    targets.add(TargetFocus(
      keyTarget: _moreKey,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'More jdkk ksdkmdkn ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ],
          )
        )
        ]
    ));

    return targets;
  }
}
