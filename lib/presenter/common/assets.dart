enum Assets {
  logo('$base/logo.svg'),
  musician('$base/musician.svg'),
  googleLogo('$base/google_logo.svg'),
  facebookLogo('$base/facebook_logo.svg'),
  appleLogo('$base/apple_logo.svg'),
  signUpStep('$base/sign_up_step.svg');

  static const String base = 'assets';

  final String path;
  const Assets(this.path);
}
