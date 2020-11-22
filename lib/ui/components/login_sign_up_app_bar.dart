import 'package:flutter/material.dart';
import 'package:sportsbet/assets/color_configuration.dart';

class LoginSignUpAppBar extends StatelessWidget {
  final tab = <Tab> [
    Tab( text:'ログイン'),
    Tab( text:'新規登録'),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: tabsColor,
      bottom: TabBar(
        tabs: tab,
      ),
    );
  }
}