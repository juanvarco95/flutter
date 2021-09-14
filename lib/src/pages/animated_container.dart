import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50;
  double _heigth = 50;
  Color _color = Colors.indigo;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Animated container'), backgroundColor: Colors.black87),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.play_arrow_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            _cambiarForma();
          }),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
          height: _heigth,
          width: _width,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
    );
  }

  void _cambiarForma() {
    // Set State IMPORTANTE!!!
    setState(() {
      Random num = Random();
      _width = num.nextInt(400).toDouble();
      _heigth = num.nextInt(400).toDouble();
      _color = Color.fromRGBO(
          num.nextInt(255), num.nextInt(255), num.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(num.nextInt(100).toDouble());
    });

    print('Width: $_width');
  }
}
