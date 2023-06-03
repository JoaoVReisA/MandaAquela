enum Assets {
  logo('$base/logo.svg'),
  musician('$base/musician.svg'),
  googleLogo('$base/google_logo.svg'),
  facebookLogo('$base/facebook_logo.svg'),
  appleLogo('$base/apple_logo.svg'),
  signUpStep('$base/sign_up_step.svg'),
  forgotPassword('$base/forgot_password.svg'),
  musicianDisplay('$base/musician_display.png'),
  contractorDisplay('$base/contractor_display.png'),
  check('$base/icon_check.svg'),
  sendEmail('$base/send_email.svg'),
  sendCode('$base/send_code.svg');

  static const String base = 'assets';

  final String path;
  const Assets(this.path);
}
