import 'package:flutter/material.dart';
import 'package:sportsbet/assets/color_configuration.dart';

class ButtonAreaDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            child: Divider(
              color: whiteColor,
              thickness: 0.8,
            ),
          ),
          Container (
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(
              '以下のアカウントを利用する',
              style: TextStyle(color: whiteColor),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 80,
            child: Divider(
              color: whiteColor,
              thickness: 0.8,
            ),
          ),
        ]
    );
  }
}