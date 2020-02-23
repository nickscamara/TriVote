import 'package:flutter/material.dart';
import 'package:votesmarter/screen/main_game.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainGame()));
            },
            padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              'Start Game',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            color: Theme.of(context).primaryColor,
          ),
        ));
  }
}
