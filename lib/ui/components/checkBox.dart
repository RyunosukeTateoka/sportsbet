import 'package:flutter/material.dart';
import 'package:sportsbet/assets/color_configuration.dart';
import 'package:provider/provider.dart';
import 'package:sportsbet/ui/viewModel/loginSignUpViewModel.dart';

const double _transformScale = 1.3;
const double _fontSize = 16;

class GoogleAuthenticatorCheckBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CheckBoxViewModel googleAuthenticatorCheckBoxViewModel = Provider.of<GoogleAuthenticatorCheckBoxViewModel>(context);
    return Row(
        children: <Widget>[
          new Transform.scale(
            scale: _transformScale,
            child: Theme (
              data: ThemeData(unselectedWidgetColor: whiteColor),
              child: new Checkbox(
                activeColor: completedColor,
                value: googleAuthenticatorCheckBoxViewModel.isChecked,
                onChanged: googleAuthenticatorCheckBoxViewModel.changeCheckBoxState,
              ),
            ),
          ),
          Text(
            'Google Authenticatorを利用する',
            style: TextStyle(color: whiteColor, fontSize: _fontSize),
          ),
        ]
    );
  }
}

class AutoLoginCheckBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CheckBoxViewModel autoLoginCheckBoxViewModel = Provider.of<AutoLoginCheckBoxViewModel>(context);
    return Row(
        children: <Widget>[
          new Transform.scale(
            scale: _transformScale,
            child: Theme (
              data: ThemeData(unselectedWidgetColor: whiteColor),
              child: new Checkbox(
                activeColor: completedColor,
                value: autoLoginCheckBoxViewModel.isChecked,
                onChanged: autoLoginCheckBoxViewModel.changeCheckBoxState,
              ),
            ),
          ),
          Text(
            '次回から自動ログイン',
            style: TextStyle(color: whiteColor, fontSize: _fontSize),
          ),
        ]
    );
  }
}

class TermsCheckBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CheckBoxViewModel termsCheckBoxViewModel = Provider.of<TermsCheckBoxViewModel>(context);
    return Row(
        children: <Widget>[
          new Transform.scale(
            scale: _transformScale,
            child: Theme (
              data: ThemeData(unselectedWidgetColor: whiteColor),
              child: new Checkbox(
                activeColor: completedColor,
                value: termsCheckBoxViewModel.isChecked,
                onChanged: termsCheckBoxViewModel.changeCheckBoxState,
              ),
            ),
          ),
          Text(
            '利用規約を確認し、同意します',
            style: TextStyle(color: whiteColor, fontSize: _fontSize),
          ),
        ]
    );
  }
}