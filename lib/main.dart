import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Spot List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Spot List'),
        ),
        body: GridView.count(
          padding: EdgeInsets.all(4.0),
          crossAxisCount: 3,
          crossAxisSpacing: 10.0, // 縦
          mainAxisSpacing: 10.0, // 横
          childAspectRatio: 0.7, // 高さ
          shrinkWrap: true,
          children: List.generate(100, (index) {

            var rng = new Random();
            var imgNumber = rng.nextInt(3);
            var assetsImage = "assets/grid/m" + imgNumber.toString() + ".png";

            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                    offset: new Offset(5.0, 5.0),
                    blurRadius: 10.0,
                  )
                ],
              ),
              child:Column(
                  children: <Widget>[
                    Image.asset(assetsImage, fit: BoxFit.cover,),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      child: Text(
                        'Spot $index',
                      ),
                    ),
                  ]
              ),
            );
          }),
        ),
      ),
    );
  }
}