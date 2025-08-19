import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

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
    quickActions.initialize()
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('This is homeo page', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      ),
    );
  }

  
}
