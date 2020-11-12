import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sportsbet/assets/color_configuration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:sportsbet/ui/components/loginSignUpBackground.dart';

const _tab = <Tab> [
  Tab( text:'ログイン'),
  Tab( text:'新規登録'),
];

class LoginPasswordManager with ChangeNotifier {
  var _hidePassword = true;

  void _changePasswordState() {
    _hidePassword = !_hidePassword;
    notifyListeners();
  }
}

class SignUpPasswordManager with ChangeNotifier {
  var _hidePassword = true;

  void _changePasswordState() {
    _hidePassword = !_hidePassword;
    notifyListeners();
  }
}

class SignUpCheckPasswordManager with ChangeNotifier {
  var _hidePassword = true;

  void _changePasswordState() {
    _hidePassword = !_hidePassword;
    notifyListeners();
  }
}

class GoogleAuthenticatorCheckBoxManager with ChangeNotifier {
  var _checkedGoogleAuthenticator = false;

  void _changeGoogleAuthenticatorState(bool check){
    _checkedGoogleAuthenticator = !_checkedGoogleAuthenticator;
    notifyListeners();
  }
}

class AutoLoginCheckBoxManager with ChangeNotifier {
  var _checkedAutoLogin = false;

  void _changeAutoLoginState(bool check){
    _checkedAutoLogin = !_checkedAutoLogin;
    notifyListeners();
  }
}

class TermsCheckBoxManager with ChangeNotifier {
  var _checkedTerms = false;

  void _changeCheckedTerms(bool check){
    _checkedTerms = !_checkedTerms;
    notifyListeners();
  }
}

class LoginEmailAddressUnderlineManager with ChangeNotifier {
  var _borderColor = whiteColor;

  void _changeBorderColorFilled(){
    _borderColor = completedColor;
    notifyListeners();
  }

  void _changeBorderColorUnfilled(){
    _borderColor = whiteColor;
    notifyListeners();
  }
}

class LoginPasswordUnderlineManager with ChangeNotifier {
  var _borderColor = whiteColor;

  void _changeBorderColorFilled(){
    _borderColor = completedColor;
    notifyListeners();
  }

  void _changeBorderColorUnfilled(){
    _borderColor = whiteColor;
    notifyListeners();
  }
}

class SignUpEmailAddressUnderlineManager with ChangeNotifier {
  var _borderColor = whiteColor;

  void _changeBorderColorFilled(){
    _borderColor = completedColor;
    notifyListeners();
  }

  void _changeBorderColorUnfilled(){
    _borderColor = whiteColor;
    notifyListeners();
  }
}

class SignUpPasswordUnderlineManager with ChangeNotifier {
  var _borderColor = whiteColor;

  void _changeBorderColorFilled(){
    _borderColor = completedColor;
    notifyListeners();
  }

  void _changeBorderColorUnfilled(){
    _borderColor = whiteColor;
    notifyListeners();
  }
}

class CheckPasswordUnderlineManager with ChangeNotifier {
  var _borderColor = whiteColor;

  void _changeBorderColorFilled(){
    _borderColor = completedColor;
    notifyListeners();
  }

  void _changeBorderColorUnfilled(){
    _borderColor = whiteColor;
    notifyListeners();
  }
}

class LoginButtonActiveManager with ChangeNotifier {
  var _emailAddressIsFilled = false;
  var _passwordIsFilled = false;

  void _fillEmailAddress(String value){
    if (value.length > 0) {
      _emailAddressIsFilled = true;
    } else {
      _emailAddressIsFilled = false;
    }
    notifyListeners();
  }

  void _fillPassword(String value){
    if (value.length > 0) {
      _passwordIsFilled = true;
    } else {
      _passwordIsFilled = false;
    }
    notifyListeners();
  }

  _createButton(String buttonLabel) {
    final _activeLoginButton = ActiveLoginButton(buttonLabel);
    final _inactiveLoginButton = InactiveLoginButton(buttonLabel);

    if (_emailAddressIsFilled == true && _passwordIsFilled == true) {
      return _activeLoginButton;
    } else {
      return _inactiveLoginButton;
    }
  }
}

class SignUpButtonActiveManager with ChangeNotifier {
  var _emailAddressIsFilled = false;
  var _passwordIsFilled = false;
  var _checkPasswordIsFilled = false;

  void _fillEmailAddress(String value){
    if (value.length > 0) {
      _emailAddressIsFilled = true;
    } else {
      _emailAddressIsFilled = false;
    }
    notifyListeners();
  }

  void _fillPassword(String value){
    if (value.length > 0) {
      _passwordIsFilled = true;
    } else {
      _passwordIsFilled = false;
    }
    notifyListeners();
  }

  void _fillCheckPassword(String value){
    if (value.length > 0) {
      _checkPasswordIsFilled = true;
    } else {
      _checkPasswordIsFilled = false;
    }
    notifyListeners();
  }

  _createButton(String buttonLabel, bool termsIsChecked) {
    final _activeLoginButton = ActiveLoginButton(buttonLabel);
    final _inactiveLoginButton = InactiveLoginButton(buttonLabel);

    if (_emailAddressIsFilled == true
        && _passwordIsFilled == true
        && _checkPasswordIsFilled == true
        && termsIsChecked == true) {
      return _activeLoginButton;
    } else {
      return _inactiveLoginButton;
    }
  }
}

class LoginSignUpFormScreen extends StatelessWidget {

  final loginPasswordManager = LoginPasswordManager();
  final signUpPasswordManager = SignUpPasswordManager();
  final signUpCheckPasswordManager = SignUpCheckPasswordManager();
  final googleAuthenticatorManager = GoogleAuthenticatorCheckBoxManager();
  final autoLoginManager = AutoLoginCheckBoxManager();
  final termsCheckBoxManager = TermsCheckBoxManager();
  final loginEmailAddressUnderlineManager = LoginEmailAddressUnderlineManager();
  final loginPasswordUnderlineManager = LoginPasswordUnderlineManager();
  final signUpEmailAddressUnderlineManager = SignUpEmailAddressUnderlineManager();
  final signUpPasswordUnderlineManager = SignUpPasswordUnderlineManager();
  final checkPasswordUnderlineManager = CheckPasswordUnderlineManager();
  final loginButtonActiveManager = LoginButtonActiveManager();
  final signUpButtonActiveManager = SignUpButtonActiveManager();

  @override
  Widget build(BuildContext context) {

    final _loginSignUpBackground = LoginSignUpBackground();

    final int _initialIndex = ModalRoute.of(context).settings.arguments;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginPasswordManager>.value (
            value: loginPasswordManager),
        ChangeNotifierProvider<SignUpPasswordManager>.value (
            value: signUpPasswordManager),
        ChangeNotifierProvider<SignUpCheckPasswordManager>.value (
            value: signUpCheckPasswordManager),
        ChangeNotifierProvider<GoogleAuthenticatorCheckBoxManager>.value (
            value: googleAuthenticatorManager),
        ChangeNotifierProvider<AutoLoginCheckBoxManager>.value (
            value: autoLoginManager),
        ChangeNotifierProvider<TermsCheckBoxManager>.value (
            value: termsCheckBoxManager),
        ChangeNotifierProvider<LoginEmailAddressUnderlineManager>.value(
            value: loginEmailAddressUnderlineManager),
        ChangeNotifierProvider<LoginPasswordUnderlineManager>.value(
            value: loginPasswordUnderlineManager),
        ChangeNotifierProvider<SignUpEmailAddressUnderlineManager>.value(
            value: signUpEmailAddressUnderlineManager),
        ChangeNotifierProvider<SignUpPasswordUnderlineManager>.value(
            value: signUpPasswordUnderlineManager),
        ChangeNotifierProvider<CheckPasswordUnderlineManager>.value(
            value: checkPasswordUnderlineManager),
        ChangeNotifierProvider<LoginButtonActiveManager>.value(
            value: loginButtonActiveManager),
        ChangeNotifierProvider<SignUpButtonActiveManager>.value(
            value: signUpButtonActiveManager),
      ],
      child: DefaultTabController(
        initialIndex: _initialIndex == null ? 0 : _initialIndex,
        length: _tab.length,
        child: Stack(
          children: <Widget>[
            _loginSignUpBackground,
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(80.0),
                child: AppBar(
                  backgroundColor: tabsColor,
                  bottom: TabBar(
                    tabs: _tab,
                  ),
                ),
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

class ActiveLoginButton extends StatelessWidget {

  final String buttonLabel;
  ActiveLoginButton(this.buttonLabel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      color: Colors.transparent,
      width: 300,
      height: 54,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () {},
        padding: EdgeInsets.all(0),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [accentColorStart, accentColorEnd],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              buttonLabel,
              style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class InactiveLoginButton extends StatelessWidget {

  final String buttonLabel;
  InactiveLoginButton(this.buttonLabel);

  @override
  Widget build(BuildContext context) {
    return                       Container(
      margin: EdgeInsets.only(top: 15),
      color: Colors.transparent,
      width: 300,
      height:54,
      child: RaisedButton(
        color: inactiveButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          buttonLabel,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        textColor: inactiveButtonTextColor,
        onPressed: () {},
      ),
    );
  }
}

class LoginTabScreen extends StatelessWidget {

  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginPasswordManager loginPasswordManageData = Provider.of<LoginPasswordManager>(context);
    GoogleAuthenticatorCheckBoxManager googleAuthenticatorManageData = Provider.of<GoogleAuthenticatorCheckBoxManager>(context);
    AutoLoginCheckBoxManager autoLoginManageData = Provider.of<AutoLoginCheckBoxManager>(context);
    LoginEmailAddressUnderlineManager loginEmailAddressUnderlineManageData = Provider.of<LoginEmailAddressUnderlineManager>(context);
    LoginPasswordUnderlineManager loginPasswordUnderlineManageData = Provider.of<LoginPasswordUnderlineManager>(context);
    LoginButtonActiveManager loginButtonActiveManageData = Provider.of<LoginButtonActiveManager>(context);

    String _emailAddress;
    String _password;

    _emailAddressController.text = _emailAddress;
    _passwordController.text = _password;

    return Scaffold(
      backgroundColor: loginSignUpTabScreenColor,
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      width: 300,
                      child: new TextFormField(
                        controller: _emailAddressController,
                        enabled: true,
                        style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                        obscureText: false,
                        maxLines:1 ,
                        decoration: InputDecoration(
                          labelText: 'メールアドレス',
                          labelStyle: TextStyle(
                              color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold
                          ),
                          contentPadding: EdgeInsets.only(bottom: 5),
                          hintText: 'sportsbet@domain.ne.jp',
                          hintStyle: TextStyle(color: hintTextColor, height: 2.5, fontSize: 18),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: loginEmailAddressUnderlineManageData._borderColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: focusedColor, width: 2),
                          ),
                        ),
                        initialValue: _emailAddress,
                        onChanged: (text){
                          _emailAddress = text;
                          loginButtonActiveManageData._fillEmailAddress(text);
                          if (text.length > 0) {
                            loginEmailAddressUnderlineManageData._changeBorderColorFilled();
                          } else {
                            loginEmailAddressUnderlineManageData._changeBorderColorUnfilled();
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 60,
                      ),
                      width: 300,
                      child: new TextFormField(
                        controller: _passwordController,
                        enabled: true,
                        style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                        obscureText: loginPasswordManageData._hidePassword,
                        maxLines:1,
                        decoration: InputDecoration(
                          labelText: 'パスワード',
                          labelStyle: TextStyle(color: whiteColor, fontSize: 18),
                          contentPadding: EdgeInsets.only(bottom: 5),
                          hintText: 'Sportsbet012',
                          hintStyle: TextStyle(color: hintTextColor, height: 2.5, fontSize: 18, fontWeight: FontWeight.bold),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: IconButton(
                            padding: EdgeInsets.only(top: 25),
                            iconSize: 18,
                            icon: Icon(
                              loginPasswordManageData._hidePassword
                                  ? FontAwesomeIcons.solidEyeSlash
                                  : FontAwesomeIcons.solidEye,
                              color: whiteColor,
                            ),
                            onPressed: () {
                              loginPasswordManageData._changePasswordState();
                            },
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: loginPasswordUnderlineManageData._borderColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: focusedColor, width: 2
                            ),
                          ),
                        ),
                        initialValue: _password,
                        onChanged: (text) {
                          _password = text;
                          loginButtonActiveManageData._fillPassword(text);
                          if (text.length > 0) {
                            loginPasswordUnderlineManageData._changeBorderColorFilled();
                          } else {
                            loginPasswordUnderlineManageData._changeBorderColorUnfilled();
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 175),
                      child: Text(
                          'お忘れの方はこちら',
                          style: TextStyle(color: linkedColor)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 60, left: 35),
                      child: Row(
                          children: <Widget>[
                            new Transform.scale(
                              scale: 1.3,
                              child: Theme (
                                data: ThemeData(unselectedWidgetColor: whiteColor),
                                child: new Checkbox(
                                  activeColor: completedColor,
                                  value: googleAuthenticatorManageData._checkedGoogleAuthenticator,
                                  onChanged: googleAuthenticatorManageData._changeGoogleAuthenticatorState,
                                ),
                              ),
                            ),
                            Text(
                              'Google Authenticatorを利用する',
                              style: TextStyle(color: whiteColor, fontSize: 16),
                            ),
                          ]
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 35),
                      child: Row(
                          children: <Widget>[
                            new Transform.scale(
                              scale: 1.3,
                              child: Theme (
                                data: ThemeData(unselectedWidgetColor: whiteColor),
                                child: new Checkbox(
                                  activeColor: completedColor,
                                  value: autoLoginManageData._checkedAutoLogin,
                                  onChanged: autoLoginManageData._changeAutoLoginState,
                                ),
                              ),
                            ),
                            Text(
                              '次回から自動ログイン',
                              style: TextStyle(color: whiteColor, fontSize: 16),
                            ),
                          ]
                      ),
                    ),
                    loginButtonActiveManageData._createButton("ログイン"),
                    Container(
                      margin: EdgeInsets.only(top: 55),
                      child: Row(
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
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container( color: Colors.transparent, width: 8),
                          Container(
                            color: Colors.transparent, width: 132, height:40,
                            child: RaisedButton(
                              color: facebookColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onPressed: () {},
                              child: Row (
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget> [
                                    Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: whiteColor,
                                      size: 18,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                    ),
                                    const Text(
                                      'Facebook',
                                      style: TextStyle(color: whiteColor),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          Container( color: Colors.transparent, width: 132, height:40,
                            child: RaisedButton(
                              color: googleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onPressed: () {},
                              child: Row (
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.google,
                                      color: whiteColor,
                                      size: 18,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 18),
                                    ),
                                    const Text(
                                      'Google',
                                      style: TextStyle(color: whiteColor),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          Container( color: Colors.transparent, width: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SignUpTabScreen extends StatelessWidget {

  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _checkPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignUpPasswordManager passwordManageData = Provider.of<SignUpPasswordManager>(context);
    SignUpCheckPasswordManager checkPasswordManageData = Provider.of<SignUpCheckPasswordManager>(context);
    SignUpEmailAddressUnderlineManager signUpEmailAddressUnderlineManageData = Provider.of<SignUpEmailAddressUnderlineManager>(context);
    SignUpPasswordUnderlineManager signUpPasswordUnderlineManageData = Provider.of<SignUpPasswordUnderlineManager>(context);
    CheckPasswordUnderlineManager checkPasswordUnderlineManageData = Provider.of<CheckPasswordUnderlineManager>(context);
    TermsCheckBoxManager termsCheckBoxManageData = Provider.of<TermsCheckBoxManager>(context);
    SignUpButtonActiveManager signUpButtonActiveManageData = Provider.of<SignUpButtonActiveManager>(context);

    String _emailAddress;
    String _password;
    String _checkPassword;

    _emailAddressController.text = _emailAddress;
    _passwordController.text = _password;
    _checkPasswordController.text = _checkPassword;

    return Scaffold(
      backgroundColor: loginSignUpTabScreenColor,
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 40,
                      ),
                      width: 300,
                      child: new TextFormField(
                        controller: _emailAddressController,
                        enabled: true,
                        style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                        obscureText: false,
                        maxLines:1 ,
                        decoration: InputDecoration(
                          labelText: 'メールアドレス',
                          labelStyle: TextStyle(
                              color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold
                          ),
                          contentPadding: EdgeInsets.only(bottom: 5),
                          hintText: 'sportsbet@domain.ne.jp',
                          hintStyle: TextStyle(color: hintTextColor, height: 2.5, fontSize: 18),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: signUpEmailAddressUnderlineManageData._borderColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: focusedColor, width: 2),
                          ),
                        ),
                        initialValue: _emailAddress,
                        onChanged: (text){
                          _emailAddress = text;
                          signUpButtonActiveManageData._fillEmailAddress(text);
                          if (text.length > 0) {
                            signUpEmailAddressUnderlineManageData._changeBorderColorFilled();
                          } else {
                            signUpEmailAddressUnderlineManageData._changeBorderColorUnfilled();
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      width: 300,
                      child: new TextFormField(
                        controller: _passwordController,
                        enabled: true,
                        style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                        obscureText: passwordManageData._hidePassword,
                        maxLines:1,
                        decoration: InputDecoration(
                          labelText: 'パスワード',
                          labelStyle: TextStyle(color: whiteColor, fontSize: 18),
                          contentPadding: EdgeInsets.only(bottom: 5),
                          hintText: 'Sportsbet012',
                          hintStyle: TextStyle(color: hintTextColor, height: 2.5, fontSize: 18, fontWeight: FontWeight.bold),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: IconButton(
                            padding: EdgeInsets.only(top: 25),
                            iconSize: 18,
                            icon: Icon(
                              passwordManageData._hidePassword
                                  ? FontAwesomeIcons.solidEyeSlash
                                  : FontAwesomeIcons.solidEye,
                              color: whiteColor,
                            ),
                            onPressed: () {
                              passwordManageData._changePasswordState();
                            },
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: signUpPasswordUnderlineManageData._borderColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: focusedColor, width: 2
                            ),
                          ),
                        ),
                        initialValue: _password,
                        onChanged: (text) {
                          _password = text;
                          signUpButtonActiveManageData._fillPassword(text);
                          if (text.length > 0) {
                            signUpPasswordUnderlineManageData._changeBorderColorFilled();
                          } else {
                            signUpPasswordUnderlineManageData._changeBorderColorUnfilled();
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      width: 300,
                      child: new TextFormField(
                        controller: _checkPasswordController,
                        enabled: true,
                        style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                        obscureText: checkPasswordManageData._hidePassword,
                        maxLines:1,
                        decoration: InputDecoration(
                          labelText: 'パスワード（確認のため再入力）',
                          labelStyle: TextStyle(color: whiteColor, fontSize: 18),
                          contentPadding: EdgeInsets.only(bottom: 5),
                          hintText: 'Sportsbet012',
                          hintStyle: TextStyle(color: hintTextColor, height: 2.5, fontSize: 18, fontWeight: FontWeight.bold),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: IconButton(
                            padding: EdgeInsets.only(top: 25),
                            iconSize: 18,
                            icon: Icon(
                              checkPasswordManageData._hidePassword
                                  ? FontAwesomeIcons.solidEyeSlash
                                  : FontAwesomeIcons.solidEye,
                              color: whiteColor,
                            ),
                            onPressed: () {
                              checkPasswordManageData._changePasswordState();
                            },
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: checkPasswordUnderlineManageData._borderColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: focusedColor, width: 2
                            ),
                          ),
                        ),
                        initialValue: _checkPassword,
                        onChanged: (text) {
                          _checkPassword = text;
                          signUpButtonActiveManageData._fillCheckPassword(text);
                          if (text.length > 0) {
                            checkPasswordUnderlineManageData._changeBorderColorFilled();
                          } else {
                            checkPasswordUnderlineManageData._changeBorderColorUnfilled();
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 42, left: 35),
                      child: Row(
                          children: <Widget>[
                            new Transform.scale(
                              scale: 1.3,
                              child: Theme (
                                data: ThemeData(unselectedWidgetColor: whiteColor),
                                child: new Checkbox(
                                  activeColor: completedColor,
                                  value: termsCheckBoxManageData._checkedTerms,
                                  onChanged: termsCheckBoxManageData._changeCheckedTerms,
                                ),
                              ),
                            ),
                            Text(
                              '利用規約を確認し、同意します',
                              style: TextStyle(color: whiteColor, fontSize: 16),
                            ),
                          ]
                      ),
                    ),
                    signUpButtonActiveManageData._createButton("新規登録", termsCheckBoxManageData._checkedTerms),
                    Container(
                      margin: EdgeInsets.only(top: 55),
                      child: Row(
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
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container( color: Colors.transparent, width: 8),
                          Container(
                            color: Colors.transparent, width: 132, height:40,
                            child: RaisedButton(
                              color: facebookColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onPressed: () {},
                              child: Row (
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget> [
                                    Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: whiteColor,
                                      size: 18,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                    ),
                                    const Text(
                                      'Facebook',
                                      style: TextStyle(color: whiteColor),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          Container( color: Colors.transparent, width: 132, height:40,
                            child: RaisedButton(
                              color: googleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              onPressed: () {},
                              child: Row (
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.google,
                                      color: whiteColor,
                                      size: 18,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 18),
                                    ),
                                    const Text(
                                      'Google',
                                      style: TextStyle(color: whiteColor),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          Container( color: Colors.transparent, width: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}