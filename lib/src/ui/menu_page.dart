import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:licor/src/widgets/NavDrawer.dart';

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {},
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Image(
            image: NetworkImage(
                'https://pbs.twimg.com/profile_images/822801223564886017/54A30Lr__400x400.jpg'),
            //https://pbs.twimg.com/profile_images/822801223564886017/54A30Lr__400x400.jpg
            height: 640,
            width: 600
            //child: Text('Side Menu Tutorial'),
            ),
      ),
    );
  }
}
