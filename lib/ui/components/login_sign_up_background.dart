import 'package:flutter/material.dart';

class LoginSignUpBackground extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('/Users/tateokaryuunosuke/AndroidStudioProjects/sportsbet/images/wallpaper_sports.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}