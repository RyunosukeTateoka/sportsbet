import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportsbet/assets/color_configuration.dart';
import 'package:sportsbet/ui/view_model/login_sign_up_view_model.dart';

const String _emailAddressLabel = 'メールアドレス';
const String _passwordLabel = 'パスワード';
const String _checkPasswordLabel = 'パスワード（確認のため再入力）';
const String _emailAddressHint = 'sportsbet@domain.ne.jp';
const String _passwordHint = 'Sportsbet012';

// TextFormField共通
const double _width = 300;
const int _maxLines = 1;
const double _iconSize = 18;
const double _borderSideWidth = 2;
const EdgeInsets _suffixIconPadding = EdgeInsets.only(top: 25);
const TextStyle _textFormFieldStyle = TextStyle(color: whiteColor, fontWeight: FontWeight.bold);
const TextStyle _labelStyle = TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold);
const EdgeInsets _contentPadding = EdgeInsets.only(bottom: 5);
const TextStyle _hintTextStyle = TextStyle(color: hintTextColor, height: 2.5, fontSize: 18);
const UnderlineInputBorder _focusedBorder = UnderlineInputBorder(borderSide: BorderSide(color: focusedColor, width: 2));


class LoginEmailAddressFormField extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UnderLineViewModel emailAddressUnderlineViewModel = Provider.of<LoginEmailAddressUnderlineViewModel>(context);
    LoginActiveButtonViewModel loginActiveButtonViewModel = Provider.of<LoginActiveButtonViewModel>(context);

    String _initialText;
    _controller.text = _initialText;

    return Container(
      width: _width,
      child: new TextFormField(
        controller: _controller,
        enabled: true,
        style: _textFormFieldStyle,
        obscureText: false,
        maxLines: _maxLines,
        decoration: InputDecoration(
          labelText: _emailAddressLabel,
          labelStyle: _labelStyle,
          contentPadding: _contentPadding,
          hintText: _emailAddressHint,
          hintStyle: _hintTextStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: emailAddressUnderlineViewModel.borderColor, width: _borderSideWidth),
          ),
          focusedBorder: _focusedBorder,
        ),
        initialValue: _initialText,
        onChanged: (String text){
          _initialText = text;
          loginActiveButtonViewModel.fillEmailAddress(text);
          if (text.length > 0) {
            emailAddressUnderlineViewModel.changeBorderColorFilled();
          } else {
            emailAddressUnderlineViewModel.changeBorderColorUnfilled();
          }
        },
      ),
    );
  }
}

class LoginPasswordFormField extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PasswordViewModel passwordViewModel = Provider.of<LoginPasswordViewModel>(context);
    UnderLineViewModel passwordUnderlineViewModel = Provider.of<LoginPasswordUnderlineViewModel>(context);
    LoginActiveButtonViewModel loginActiveButtonViewModel = Provider.of<LoginActiveButtonViewModel>(context);

    String _initialText;
    _controller.text = _initialText;

    return Container(
      width: _width,
      child: new TextFormField(
        controller: _controller,
        enabled: true,
        style: _textFormFieldStyle,
        obscureText: passwordViewModel.hidePassword,
        maxLines: _maxLines,
        decoration: InputDecoration(
          labelText: _passwordLabel,
          labelStyle: _labelStyle,
          contentPadding: _contentPadding,
          hintText: _passwordHint,
          hintStyle: _hintTextStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(
            padding: _suffixIconPadding,
            iconSize: _iconSize,
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
            borderSide: BorderSide(color: passwordUnderlineViewModel.borderColor, width: _borderSideWidth),
          ),
          focusedBorder: _focusedBorder,
        ),
        initialValue: _initialText,
        onChanged: (text){
          _initialText = text;
          loginActiveButtonViewModel.fillPassword(text);
          if (text.length > 0) {
            passwordUnderlineViewModel.changeBorderColorFilled();
          } else {
            passwordUnderlineViewModel.changeBorderColorUnfilled();
          }
        },
      ),
    );
  }
}

class SignUpEmailAddressFormField extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UnderLineViewModel emailAddressUnderlineViewModel = Provider.of<SignUpEmailAddressUnderlineViewModel>(context);
    SignUpActiveButtonViewModel signUpActiveButtonViewModel = Provider.of<SignUpActiveButtonViewModel>(context);

    String _initialText;
    _controller.text = _initialText;

    return Container(
      width: _width,
      child: new TextFormField(
        controller: _controller,
        enabled: true,
        style: _textFormFieldStyle,
        obscureText: false,
        maxLines: _maxLines,
        decoration: InputDecoration(
          labelText: _emailAddressLabel,
          labelStyle: _labelStyle,
          contentPadding: _contentPadding,
          hintText: _emailAddressHint,
          hintStyle: _hintTextStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: emailAddressUnderlineViewModel.borderColor, width: _borderSideWidth),
          ),
          focusedBorder: _focusedBorder,
        ),
        initialValue: _initialText,
        onChanged: (String text){
          _initialText = text;
          signUpActiveButtonViewModel.fillEmailAddress(text);
          if (text.length > 0) {
            emailAddressUnderlineViewModel.changeBorderColorFilled();
          } else {
            emailAddressUnderlineViewModel.changeBorderColorUnfilled();
          }
        },
      ),
    );
  }
}

class SignUpPasswordFormField extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PasswordViewModel passwordViewModel = Provider.of<SignUpPasswordViewModel>(context);
    UnderLineViewModel passwordUnderlineViewModel = Provider.of<SignUpPasswordUnderlineViewModel>(context);
    SignUpActiveButtonViewModel signUpActiveButtonViewModel = Provider.of<SignUpActiveButtonViewModel>(context);

    String _initialText;
    _controller.text = _initialText;

    return Container(
      width: _width,
      child: new TextFormField(
        controller: _controller,
        enabled: true,
        style: _textFormFieldStyle,
        obscureText: passwordViewModel.hidePassword,
        maxLines: _maxLines,
        decoration: InputDecoration(
          labelText: _passwordLabel,
          labelStyle: _labelStyle,
          contentPadding: _contentPadding,
          hintText: _passwordHint,
          hintStyle: _hintTextStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(
            padding: _suffixIconPadding,
            iconSize: _iconSize,
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
            borderSide: BorderSide(color: passwordUnderlineViewModel.borderColor, width: _borderSideWidth),
          ),
          focusedBorder: _focusedBorder,
        ),
        initialValue: _initialText,
        onChanged: (text){
          _initialText = text;
          signUpActiveButtonViewModel.fillPassword(text);
          if (text.length > 0) {
            passwordUnderlineViewModel.changeBorderColorFilled();
          } else {
            passwordUnderlineViewModel.changeBorderColorUnfilled();
          }
        },
      ),
    );
  }
}

class SignUpCheckPasswordFormField extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PasswordViewModel passwordViewModel = Provider.of<SignUpCheckPasswordViewModel>(context);
    UnderLineViewModel passwordUnderlineViewModel = Provider.of<CheckPasswordUnderlineViewModel>(context);
    SignUpActiveButtonViewModel signUpActiveButtonViewModel = Provider.of<SignUpActiveButtonViewModel>(context);

    String _initialText;
    _controller.text = _initialText;

    return Container(
      width: _width,
      child: new TextFormField(
        controller: _controller,
        enabled: true,
        style: _textFormFieldStyle,
        obscureText: passwordViewModel.hidePassword,
        maxLines: _maxLines,
        decoration: InputDecoration(
          labelText: _checkPasswordLabel,
          labelStyle: _labelStyle,
          contentPadding: _contentPadding,
          hintText: _passwordHint,
          hintStyle: _hintTextStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(
            padding: _suffixIconPadding,
            iconSize: _iconSize,
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
            borderSide: BorderSide(color: passwordUnderlineViewModel.borderColor, width: _borderSideWidth),
          ),
          focusedBorder: _focusedBorder,
        ),
        initialValue: _initialText,
        onChanged: (text){
          _initialText = text;
          signUpActiveButtonViewModel.fillCheckPassword(text);
          if (text.length > 0) {
            passwordUnderlineViewModel.changeBorderColorFilled();
          } else {
            passwordUnderlineViewModel.changeBorderColorUnfilled();
          }
        },
      ),
    );
  }
}