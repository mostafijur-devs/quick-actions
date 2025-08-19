import 'package:flutter/material.dart';

class SecendScreen extends StatelessWidget {
  const SecendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Second Screen Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('This is second screen page', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
