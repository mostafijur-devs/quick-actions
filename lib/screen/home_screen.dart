import 'package:flutter/material.dart';
import 'package:quick_action/screen/secend_screen.dart';
import 'package:quick_actions/quick_actions.dart';

import 'frist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuickActions quickActions = QuickActions();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quickAction();
  }

  void _quickAction() {
    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(type: 'frist_screen', localizedTitle: 'Go To Frist Screen',icon: 'ic_launcher'),
      ShortcutItem(
        type: 'secend_screen',
        localizedTitle: 'Go To Second Screen',
        icon:'images',
        localizedSubtitle: 'open second screen'
      ),
    ]);
    quickActions.initialize((type) {
      if (type != null) {
        if (type == 'frist_screen') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FristScreen()),
          );
        } else if (type == 'secend_screen') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecendScreen()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), centerTitle: true),
      body: Center(
        child: Text(
          'This is homeo page',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
