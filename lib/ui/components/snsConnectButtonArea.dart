import 'package:flutter/material.dart';
import 'package:sportsbet/ui/components/button.dart';
import 'package:sportsbet/ui/components/buttonAreaDivider.dart';

class SnsConnectButtonArea extends StatelessWidget {

  final ButtonAreaDivider _buttonAreaDivider = ButtonAreaDivider();
  final FacebookConnectButton _facebookConnectButton = FacebookConnectButton();
  final GoogleConnectButton _googleConnectButton = GoogleConnectButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 55),
          child: _buttonAreaDivider,
        ),
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container( color: Colors.transparent, width: 8),
              _facebookConnectButton,
              _googleConnectButton,
              Container( color: Colors.transparent, width: 8),
            ],
          ),
        ),
      ],
    );
  }
}