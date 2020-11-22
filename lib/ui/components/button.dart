import 'package:flutter/material.dart';
import 'package:sportsbet/assets/color_configuration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const int _loginInitIndex = 0;
const int _signUpInitIndex = 1;
const String _loginLabel = 'ログイン';
const String _signUpLabel = '新規登録';
const Text _facebookLabelText = Text(
  'Facebook',
  style: TextStyle(color: whiteColor));
const Text _googleLabelText = Text(
  'Google',
  style: TextStyle(color: whiteColor));
const Icon _facebookIcon = Icon(
  FontAwesomeIcons.facebookF,
  color: whiteColor,
  size: 18,
);
const Icon _googleIcon = Icon(
  FontAwesomeIcons.google,
  color: whiteColor,
  size: 18,
);

abstract class BaseButtonOnInitScreen extends StatelessWidget {

  final int initialIndex;
  final String buttonLabel;

  BaseButtonOnInitScreen({this.initialIndex, this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return Container( color: Colors.transparent, width: 132, height:40,
      child: RaisedButton(
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          buttonLabel,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        textColor: textOnWhiteButtonColor,
        onPressed: () => Navigator.of(context).pushReplacementNamed("/loginSignUpFormScreen", arguments: initialIndex),
      ),
    );
  }
}

class LoginButtonOnInitScreen extends BaseButtonOnInitScreen{
  @override
  int get initialIndex => _loginInitIndex;
  String get buttonLabel => _loginLabel;
}

class SignUpButtonOnInitScreen extends BaseButtonOnInitScreen{
  @override
  int get initialIndex => _signUpInitIndex;
  String get buttonLabel => _signUpLabel;
}

abstract class SnsConnectButton extends StatelessWidget {
  final buttonColor;
  final icon;
  final labelText;

  SnsConnectButton({this.buttonColor, this.icon, this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, width: 132, height:40,
      child: RaisedButton(
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: () {},
        child: Row (
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              icon,
              Container(
                padding: EdgeInsets.only(left: 10),
              ),
              labelText,
            ]
        ),
      ),
    );
  }
}

class FacebookConnectButton extends SnsConnectButton {
  @override
  Color get buttonColor => facebookColor;
  Icon get icon => _facebookIcon;
  Text get labelText => _facebookLabelText;
}

class GoogleConnectButton extends SnsConnectButton {
  @override
  Color get buttonColor => googleColor;
  Icon get icon => _googleIcon;
  Text get labelText => _googleLabelText;
}

abstract class BaseButtonOnTabScreen extends StatelessWidget {

  final String _buttonLabel;
  final double _buttonWidth = 300;
  final double _buttonHeight = 54;
  final RoundedRectangleBorder _roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16));
  final EdgeInsets _paddingEdgeInsets = EdgeInsets.all(0);
  final BorderRadius _borderRadius = BorderRadius.circular(16);
  final TextStyle _labelTextStyle = TextStyle(
      color: inactiveButtonTextColor,
      fontWeight: FontWeight.bold);

  BaseButtonOnTabScreen(this._buttonLabel);

  String get buttonLabel => _buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: _buttonWidth,
      height: _buttonHeight,
      child: RaisedButton(
        color: inactiveButtonColor,
        shape: _roundedRectangleBorder,
        child: Text(
          _buttonLabel,
          style: _labelTextStyle,
        ),
        textColor: inactiveButtonTextColor,
        onPressed: () {},
      ),
    );
  }
}

class ActiveButton extends BaseButtonOnTabScreen {
  ActiveButton(String buttonLabel) : super(buttonLabel);

  @override
  TextStyle get _labelTextStyle => TextStyle(
      color: whiteColor,
      fontWeight: FontWeight.bold);

  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: _buttonWidth,
      height: _buttonHeight,
      child: RaisedButton(
        shape: _roundedRectangleBorder,
        onPressed: () => Navigator.of(context).pushReplacementNamed("/appHomeScreen"),
        padding: _paddingEdgeInsets,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [accentColorStart, accentColorEnd],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: _borderRadius,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              buttonLabel,
              style: _labelTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}

class InactiveButton extends BaseButtonOnTabScreen {
  InactiveButton(String buttonLabel) : super(buttonLabel);
}

class ActiveLoginButton extends StatelessWidget {
  final ActiveButton _activeLoginButton = ActiveButton(_loginLabel);

  @override
  Widget build(BuildContext context) {
    return _activeLoginButton;
  }
}

class ActiveSignUpButton extends StatelessWidget {
  final ActiveButton _activeSignUpButton = ActiveButton(_signUpLabel);

  @override
  Widget build(BuildContext context) {
    return _activeSignUpButton;
  }
}

class InactiveLoginButton extends StatelessWidget {
  final InactiveButton _inactiveButton = InactiveButton(_loginLabel);

  @override
  Widget build(BuildContext context) {
    return _inactiveButton;
  }
}

class InactiveSignUpButton extends StatelessWidget {
  final InactiveButton _inactiveButton = InactiveButton(_signUpLabel);

  @override
  Widget build(BuildContext context) {
    return _inactiveButton;
  }
}