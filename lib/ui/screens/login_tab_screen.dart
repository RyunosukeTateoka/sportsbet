import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportsbet/ui/view_model/login_sign_up_view_model.dart';
import 'package:sportsbet/assets/color_configuration.dart';
import 'package:sportsbet/ui/components/single_sentence_form_field.dart';
import 'package:sportsbet/ui/components/check_box.dart';
import 'package:sportsbet/ui/components/sns_connect_button_area.dart';

class LoginTabScreen extends StatelessWidget {

  final LoginEmailAddressFormField _loginEmailAddressFormField = LoginEmailAddressFormField();
  final LoginPasswordFormField _loginPasswordFormField = LoginPasswordFormField();
  final GoogleAuthenticatorCheckBox _googleAuthenticatorCheckBox = GoogleAuthenticatorCheckBox();
  final AutoLoginCheckBox _autoLoginCheckBox = AutoLoginCheckBox();
  final SnsConnectButtonArea _snsConnectButtonArea = SnsConnectButtonArea();

  @override
  Widget build(BuildContext context) {
    LoginActiveButtonViewModel loginActiveButtonViewModel = Provider.of<LoginActiveButtonViewModel>(context);

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
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      child: _loginEmailAddressFormField,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 60,
                      ),
                      child: _loginPasswordFormField,
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
                      child: _googleAuthenticatorCheckBox,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 35),
                      child: _autoLoginCheckBox,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: loginActiveButtonViewModel.createLoginButton(),
                    ),
                    _snsConnectButtonArea,
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