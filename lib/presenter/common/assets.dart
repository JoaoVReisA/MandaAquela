enum Assets {
  greg('$base/example_image.png'),
  calendar('$base/calendar_month.svg'),
  backButton('$base/back_button.svg'),
  musicNote('$base/music_note.svg'),
  piano('$base/piano.svg'),
  done('$base/done.svg'),
  storefront('$base/storefront.svg'),
  person('$base/person.svg'),
  star('$base/star.svg'),
  money('$base/monetization_on.svg'),
  alarm('$base/alarm.svg'),
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
  sendCode('$base/send_code.svg'),
  addressHouse('$base/address_house.svg'),
  findImage('$base/find_image.svg'),
  galleryImage('$base/gallery_image.svg'),
  socialMediaSelect('$base/social_media_select.svg'),
  facebookBlackLogo('$base/facebook_black_logo.svg'),
  instagramBlackLogo('$base/instagram_black_logo.svg'),
  tikTokBlackLogo('$base/tik_tok_black_logo.svg'),
  youtubeBlackLogo('$base/youtube_black_logo.svg'),
  musicianDisplayGrey('$base/musician_display_grey.png'),
  contractorDisplayGrey('$base/contractor_display_grey.png'),
  musicianGuitar('$base/musician_guitar.svg'),
  guitarIcon('$base/icon_guitar.png'),
  musicalNoteIcon('$base/icon_musical_note.svg'),
  moneyIcon('$base/icon_money.svg'),
  eventsPeople('$base/events_people.svg'),
  eventGlobal('$base/event_global.svg'),
  opportunityMan('$base/opportunity_man.svg');

  static const String base = 'assets';

  final String path;
  const Assets(this.path);
}
