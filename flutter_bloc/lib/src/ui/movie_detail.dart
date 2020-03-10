
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text('test'),
          RaisedButton(
            onPressed: () {
             Navigator.pop(context, 'Yep!');
              },
              child: Text('Back!'),
          )
        ],)
      ),
    );
  }
}