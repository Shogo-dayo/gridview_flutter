import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Spot List',
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Spot List'),
        ),
        body: GridView.count(
          padding: EdgeInsets.all(4.0),
          crossAxisCount: 4,
          crossAxisSpacing: 10.0, // 縦
          mainAxisSpacing: 10.0, // 横
          childAspectRatio: 0.7, // 高さ
          shrinkWrap: true,
          children: List.generate(100,
                  _generator),
        ),
      ),
    );
  }

  Widget _generator(int index) {

    var rng = new Random();
    var imgNumber = rng.nextInt(3);
    var assetsImage = "assets/grid/m" + imgNumber.toString() + ".png";

    return GestureDetector(
      child: GridTile(
        child: Container(
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
          child: Column(
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
        ),
      ),
      onTap: () {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text('You double tapped on ${index + 1}'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
    );
  }
}