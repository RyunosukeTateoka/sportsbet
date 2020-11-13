import 'package:flutter/material.dart';
import 'package:sportsbet/assets/color_configuration.dart';

const _loginInitIndex = 0;
const _signUpInitIndex = 1;
const _loginLabel = 'ログイン';
const _signUpLabel = '新規登録';

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
        onPressed: () {},
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