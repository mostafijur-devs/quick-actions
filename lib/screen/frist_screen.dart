import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('First Screen Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('This is first screen page', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
