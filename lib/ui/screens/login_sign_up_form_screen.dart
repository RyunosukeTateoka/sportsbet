import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportsbet/ui/components/login_sign_up_background.dart';
import 'package:sportsbet/ui/view_model/login_sign_up_view_model.dart';
import 'package:sportsbet/ui/components/login_sign_up_app_bar.dart';
import 'package:sportsbet/ui/screens/login_tab_screen.dart';
import 'package:sportsbet/ui/screens/sign_up_tab_screen.dart';

class LoginSignUpFormScreen extends StatelessWidget {

  final PasswordViewModel loginPasswordViewModel = LoginPasswordViewModel();
  final PasswordViewModel signUpPasswordViewModel = SignUpPasswordViewModel();
  final PasswordViewModel signUpCheckPasswordViewModel = SignUpCheckPasswordViewModel();
  final CheckBoxViewModel googleAuthenticatorVIewModel = GoogleAuthenticatorCheckBoxViewModel();
  final CheckBoxViewModel autoLoginViewModel = AutoLoginCheckBoxViewModel();
  final CheckBoxViewModel termsCheckBoxViewModel = TermsCheckBoxViewModel();
  final UnderLineViewModel loginEmailAddressUnderlineViewModel = LoginEmailAddressUnderlineViewModel();
  final UnderLineViewModel loginPasswordUnderlineViewModel = LoginPasswordUnderlineViewModel();
  final UnderLineViewModel signUpEmailAddressUnderlineViewModel = SignUpEmailAddressUnderlineViewModel();
  final UnderLineViewModel signUpPasswordUnderlineViewModel = SignUpPasswordUnderlineViewModel();
  final UnderLineViewModel checkPasswordUnderlineViewModel = CheckPasswordUnderlineViewModel();
  final ActiveButtonViewModel loginActiveButtonViewModel = LoginActiveButtonViewModel();
  final ActiveButtonViewModel signUpActiveButtonViewModel = SignUpActiveButtonViewModel();

  final LoginSignUpAppBar _loginSignUpAppBar = LoginSignUpAppBar();

  @override
  Widget build(BuildContext context) {

    final _loginSignUpBackground = LoginSignUpBackground();

    final int _initialIndex = ModalRoute.of(context).settings.arguments;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginPasswordViewModel>.value (
            value: loginPasswordViewModel),
        ChangeNotifierProvider<SignUpPasswordViewModel>.value (
            value: signUpPasswordViewModel),
        ChangeNotifierProvider<SignUpCheckPasswordViewModel>.value (
            value: signUpCheckPasswordViewModel),
        ChangeNotifierProvider<GoogleAuthenticatorCheckBoxViewModel>.value (
            value: googleAuthenticatorVIewModel),
        ChangeNotifierProvider<AutoLoginCheckBoxViewModel>.value (
            value: autoLoginViewModel),
        ChangeNotifierProvider<TermsCheckBoxViewModel>.value (
            value: termsCheckBoxViewModel),
        ChangeNotifierProvider<LoginEmailAddressUnderlineViewModel>.value(
            value: loginEmailAddressUnderlineViewModel),
        ChangeNotifierProvider<LoginPasswordUnderlineViewModel>.value(
            value: loginPasswordUnderlineViewModel),
        ChangeNotifierProvider<SignUpEmailAddressUnderlineViewModel>.value(
            value: signUpEmailAddressUnderlineViewModel),
        ChangeNotifierProvider<SignUpPasswordUnderlineViewModel>.value(
            value: signUpPasswordUnderlineViewModel),
        ChangeNotifierProvider<CheckPasswordUnderlineViewModel>.value(
            value: checkPasswordUnderlineViewModel),
        ChangeNotifierProvider<LoginActiveButtonViewModel>.value(
            value: loginActiveButtonViewModel),
        ChangeNotifierProvider<SignUpActiveButtonViewModel>.value(
            value: signUpActiveButtonViewModel),
      ],
      child: DefaultTabController(
        initialIndex: _initialIndex == null ? 0 : _initialIndex,
        length: _loginSignUpAppBar.tab.length,
        child: Stack(
          children: <Widget>[
            _loginSignUpBackground,
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(80.0),
                child: _loginSignUpAppBar,
              ),
              body: TabBarView(
                  children: <Widget> [
                    LoginTabScreen(),
                    SignUpTabScreen()
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
