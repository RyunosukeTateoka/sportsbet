import 'package:flutter/material.dart';
import 'package:sportsbet/assets/color_configuration.dart';
import 'package:sportsbet/ui/components/button.dart';

abstract class PasswordViewModel with ChangeNotifier {
  var hidePassword = true;

  void changePasswordState() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
}

class LoginPasswordViewModel extends PasswordViewModel {
}

class SignUpPasswordViewModel extends PasswordViewModel {
}

class SignUpCheckPasswordViewModel extends PasswordViewModel {
}

abstract class CheckBoxViewModel with ChangeNotifier {
  var isChecked = false;

  void changeCheckBoxState(bool check) {
    isChecked = !isChecked;
    notifyListeners();
  }
}

class GoogleAuthenticatorCheckBoxViewModel extends CheckBoxViewModel {
}

class AutoLoginCheckBoxViewModel extends CheckBoxViewModel {
}

class TermsCheckBoxViewModel extends CheckBoxViewModel {
}

abstract class UnderLineViewModel with ChangeNotifier {
  var borderColor = whiteColor;

  void changeBorderColorFilled(){
    borderColor = completedColor;
    notifyListeners();
  }

  void changeBorderColorUnfilled(){
    borderColor = whiteColor;
    notifyListeners();
  }

}

class LoginEmailAddressUnderlineViewModel extends UnderLineViewModel {
}

class LoginPasswordUnderlineViewModel extends UnderLineViewModel {
}

class SignUpEmailAddressUnderlineViewModel extends UnderLineViewModel {
}

class SignUpPasswordUnderlineViewModel extends UnderLineViewModel {
}

class CheckPasswordUnderlineViewModel extends UnderLineViewModel {
}

abstract class ActiveButtonViewModel with ChangeNotifier {
  var emailAddressIsFilled = false;
  var passwordIsFilled = false;

  void fillEmailAddress(String value){
    if (value.length > 0) {
      emailAddressIsFilled = true;
    } else {
      emailAddressIsFilled = false;
    }
    notifyListeners();
  }

  void fillPassword(String value){
    if (value.length > 0) {
      passwordIsFilled = true;
    } else {
      passwordIsFilled = false;
    }
    notifyListeners();
  }
}

class LoginActiveButtonViewModel extends ActiveButtonViewModel {
  createLoginButton() {
    final _activeLoginButton = ActiveLoginButton();
    final _inactiveLoginButton = InactiveLoginButton();

    if (emailAddressIsFilled == true && passwordIsFilled == true) {
      return _activeLoginButton;
    } else {
      return _inactiveLoginButton;
    }
  }

}

class SignUpActiveButtonViewModel extends ActiveButtonViewModel {
  var checkPasswordIsFilled = false;

  void fillCheckPassword(String value){
    if (value.length > 0) {
      checkPasswordIsFilled = true;
    } else {
      checkPasswordIsFilled = false;
    }
    notifyListeners();
  }

  createSignUpButton(bool termsIsChecked) {
    final _activeLoginButton = ActiveSignUpButton();
    final _inactiveLoginButton = InactiveSignUpButton();

    if (emailAddressIsFilled == true
        && passwordIsFilled == true
        && checkPasswordIsFilled == true
        && termsIsChecked == true) {
      return _activeLoginButton;
    } else {
      return _inactiveLoginButton;
    }
  }
}