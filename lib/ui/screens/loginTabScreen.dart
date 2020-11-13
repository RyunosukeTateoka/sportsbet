import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportsbet/ui/viewModel/loginSignUpViewModel.dart';
import 'package:sportsbet/assets/color_configuration.dart';

class LoginTabScreen extends StatelessWidget {

  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PasswordViewModel loginPasswordViewModel = Provider.of<LoginPasswordViewModel>(context);
    UnderLineViewModel emailAddressUnderlineViewModel = Provider.of<LoginEmailAddressUnderlineViewModel>(context);
    UnderLineViewModel passwordUnderlineViewModel = Provider.of<LoginPasswordUnderlineViewModel>(context);
    CheckBoxViewModel googleAuthenticatorCheckBoxViewModel = Provider.of<GoogleAuthenticatorCheckBoxViewModel>(context);
    CheckBoxViewModel autoLoginCheckBoxViewModel = Provider.of<AutoLoginCheckBoxViewModel>(context);
    LoginActiveButtonViewModel loginActiveButtonViewModel = Provider.of<LoginActiveButtonViewModel>(context);

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
                            borderSide: BorderSide(color: emailAddressUnderlineViewModel.borderColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: focusedColor, width: 2),
                          ),
                        ),
                        initialValue: _emailAddress,
                        onChanged: (text){
                          _emailAddress = text;
                          loginActiveButtonViewModel.fillEmailAddress(text);
                          if (text.length > 0) {
                            emailAddressUnderlineViewModel.changeBorderColorFilled();
                          } else {
                            emailAddressUnderlineViewModel.changeBorderColorUnfilled();
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
                        obscureText: loginPasswordViewModel.hidePassword,
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
                              loginPasswordViewModel.hidePassword
                                  ? FontAwesomeIcons.solidEyeSlash
                                  : FontAwesomeIcons.solidEye,
                              color: whiteColor,
                            ),
                            onPressed: () {
                              loginPasswordViewModel.changePasswordState();
                            },
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: passwordUnderlineViewModel.borderColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: focusedColor, width: 2
                            ),
                          ),
                        ),
                        initialValue: _password,
                        onChanged: (text) {
                          _password = text;
                          loginActiveButtonViewModel.fillPassword(text);
                          if (text.length > 0) {
                            passwordUnderlineViewModel.changeBorderColorFilled();
                          } else {
                            passwordUnderlineViewModel.changeBorderColorUnfilled();
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
                                  value: googleAuthenticatorCheckBoxViewModel.isChecked,
                                  onChanged: googleAuthenticatorCheckBoxViewModel.changeCheckBoxState,
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
                                  value: autoLoginCheckBoxViewModel.isChecked,
                                  onChanged: autoLoginCheckBoxViewModel.changeCheckBoxState,
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
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: loginActiveButtonViewModel.createLoginButton(),
                    ),
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