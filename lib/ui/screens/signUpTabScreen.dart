import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportsbet/ui/viewModel/loginSignUpViewModel.dart';
import 'package:sportsbet/assets/color_configuration.dart';

class SignUpTabScreen extends StatelessWidget {

  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _checkPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PasswordViewModel passwordViewModel = Provider.of<SignUpPasswordViewModel>(context);
    PasswordViewModel checkPasswordViewModel = Provider.of<SignUpCheckPasswordViewModel>(context);
    UnderLineViewModel emailAddressUnderlineViewModel = Provider.of<SignUpEmailAddressUnderlineViewModel>(context);
    UnderLineViewModel passwordUnderlineViewModel = Provider.of<SignUpPasswordUnderlineViewModel>(context);
    UnderLineViewModel checkPasswordUnderlineViewModel = Provider.of<CheckPasswordUnderlineViewModel>(context);
    CheckBoxViewModel termsCheckBoxViewModel = Provider.of<TermsCheckBoxViewModel>(context);
    SignUpActiveButtonViewModel signUpActiveButtonViewModel = Provider.of<SignUpActiveButtonViewModel>(context);

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
                            borderSide: BorderSide(color: emailAddressUnderlineViewModel.borderColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: focusedColor, width: 2),
                          ),
                        ),
                        initialValue: _emailAddress,
                        onChanged: (text){
                          _emailAddress = text;
                          signUpActiveButtonViewModel.fillEmailAddress(text);
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
                        top: 50,
                      ),
                      width: 300,
                      child: new TextFormField(
                        controller: _passwordController,
                        enabled: true,
                        style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                        obscureText: passwordViewModel.hidePassword,
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
                              passwordViewModel.hidePassword
                                  ? FontAwesomeIcons.solidEyeSlash
                                  : FontAwesomeIcons.solidEye,
                              color: whiteColor,
                            ),
                            onPressed: () {
                              passwordViewModel.changePasswordState();
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
                          signUpActiveButtonViewModel.fillPassword(text);
                          if (text.length > 0) {
                            passwordUnderlineViewModel.changeBorderColorFilled();
                          } else {
                            passwordUnderlineViewModel.changeBorderColorUnfilled();
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
                        obscureText: checkPasswordViewModel.hidePassword,
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
                              checkPasswordViewModel.hidePassword
                                  ? FontAwesomeIcons.solidEyeSlash
                                  : FontAwesomeIcons.solidEye,
                              color: whiteColor,
                            ),
                            onPressed: () {
                              checkPasswordViewModel.changePasswordState();
                            },
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: checkPasswordUnderlineViewModel.borderColor, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: focusedColor, width: 2
                            ),
                          ),
                        ),
                        initialValue: _checkPassword,
                        onChanged: (text) {
                          _checkPassword = text;
                          signUpActiveButtonViewModel.fillCheckPassword(text);
                          if (text.length > 0) {
                            checkPasswordUnderlineViewModel.changeBorderColorFilled();
                          } else {
                            checkPasswordUnderlineViewModel.changeBorderColorUnfilled();
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
                                  value: termsCheckBoxViewModel.isChecked,
                                  onChanged: termsCheckBoxViewModel.changeCheckBoxState,
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
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: signUpActiveButtonViewModel.createSignUpButton(termsCheckBoxViewModel.isChecked),
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