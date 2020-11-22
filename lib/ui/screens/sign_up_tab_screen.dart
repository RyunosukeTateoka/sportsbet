import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportsbet/ui/view_model/login_sign_up_view_model.dart';
import 'package:sportsbet/assets/color_configuration.dart';
import 'package:sportsbet/ui/components/single_sentence_form_field.dart';
import 'package:sportsbet/ui/components/check_box.dart';
import 'package:sportsbet/ui/components/sns_connect_button_area.dart';

class SignUpTabScreen extends StatelessWidget {

  final SignUpEmailAddressFormField _signUpEmailAddressFormField = SignUpEmailAddressFormField();
  final SignUpPasswordFormField _signUpPasswordFormField = SignUpPasswordFormField();
  final SignUpCheckPasswordFormField _signUpCheckPasswordFormField = SignUpCheckPasswordFormField();
  final TermsCheckBox _termsCheckBox = TermsCheckBox();
  final SnsConnectButtonArea _snsConnectButtonArea = SnsConnectButtonArea();

  @override
  Widget build(BuildContext context) {
    CheckBoxViewModel termsCheckBoxViewModel = Provider.of<TermsCheckBoxViewModel>(context);
    SignUpActiveButtonViewModel signUpActiveButtonViewModel = Provider.of<SignUpActiveButtonViewModel>(context);

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
                        top: 40,
                      )
                    ),
                    _signUpEmailAddressFormField,
                    Container(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                    ),
                    _signUpPasswordFormField,
                    Container(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                    ),
                    _signUpCheckPasswordFormField,
                    Container(
                      padding: EdgeInsets.only(top: 42, left: 35),
                      child: _termsCheckBox,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: signUpActiveButtonViewModel.createSignUpButton(termsCheckBoxViewModel.isChecked),
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