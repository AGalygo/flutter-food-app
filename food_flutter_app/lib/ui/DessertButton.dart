import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DessertButton extends StatelessWidget {
  DessertButton({
    this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: RaisedButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.brown[400],
              fontWeight: FontWeight.w300,
            ),
          ),
          color: Colors.pink[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(8.0)
            ),
          ),

        ),

    );
  }

}