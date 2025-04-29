import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'translations/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Chat bot'**
  String get appName;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @selectTheme.
  ///
  /// In en, this message translates to:
  /// **'Select Theme'**
  String get selectTheme;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Hello in Imagine Ai Here You Can Draw and play Your Imaginations'**
  String get welcomeMessage;

  /// No description provided for @letsStart.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start'**
  String get letsStart;

  /// No description provided for @onBoardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Unleash Your Creativity'**
  String get onBoardingTitle1;

  /// No description provided for @onBoardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'AI-Powered Art at Your Fingertips'**
  String get onBoardingTitle2;

  /// No description provided for @onBoardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Share and Inspire'**
  String get onBoardingTitle3;

  /// No description provided for @onBoardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Transform your ideas into stunning images and videos with just a few words. Let your imagination run wild and watch it come to life!'**
  String get onBoardingDesc1;

  /// No description provided for @onBoardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Create unique visuals effortlessly with advanced AI technology. No design skills needed—just describe, and we’ll create.'**
  String get onBoardingDesc2;

  /// No description provided for @onBoardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'Easily download and share your creations with the world. Spread your artistic vision and inspire others with your masterpieces.'**
  String get onBoardingDesc3;

  /// No description provided for @youAreJustOneStepAway.
  ///
  /// In en, this message translates to:
  /// **'You Are Just One Step Away'**
  String get youAreJustOneStepAway;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forget_password;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don’t Have Account?'**
  String get dont_have_account;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @login_with_google.
  ///
  /// In en, this message translates to:
  /// **'Login With Google'**
  String get login_with_google;

  /// No description provided for @name_cannot_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Name cannot be empty'**
  String get name_cannot_be_empty;

  /// No description provided for @name_min_length.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters long'**
  String get name_min_length;

  /// No description provided for @name_max_length.
  ///
  /// In en, this message translates to:
  /// **'Name cannot be longer than 50 characters'**
  String get name_max_length;

  /// No description provided for @name_invalid_chars.
  ///
  /// In en, this message translates to:
  /// **'Name can only contain letters and spaces'**
  String get name_invalid_chars;

  /// No description provided for @emailCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty'**
  String get emailCannotBeEmpty;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get enterValidEmail;

  /// No description provided for @password_empty_error.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get password_empty_error;

  /// No description provided for @password_length_error.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get password_length_error;

  /// No description provided for @password_uppercase_error.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter'**
  String get password_uppercase_error;

  /// No description provided for @password_lowercase_error.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lowercase letter'**
  String get password_lowercase_error;

  /// No description provided for @password_number_error.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number'**
  String get password_number_error;

  /// No description provided for @password_special_error.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character (!@#\$&*~)'**
  String get password_special_error;

  /// No description provided for @confirm_password_empty_error.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirm_password_empty_error;

  /// No description provided for @password_match_error.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get password_match_error;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already Have Account?'**
  String get alreadyHaveAccount;

  /// No description provided for @rePassword.
  ///
  /// In en, this message translates to:
  /// **'Re-Password'**
  String get rePassword;

  /// No description provided for @forgetPasswordMessage.
  ///
  /// In en, this message translates to:
  /// **'Forget Your Password , Don’t Worry Enter Your Email and We Will Send Reset password Email TO Your Mail'**
  String get forgetPasswordMessage;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @creatingAccount.
  ///
  /// In en, this message translates to:
  /// **'Creating Your Account ...'**
  String get creatingAccount;

  /// No description provided for @accountCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Account Created Successfully'**
  String get accountCreatedSuccessfully;

  /// No description provided for @socketExceptionMessage.
  ///
  /// In en, this message translates to:
  /// **'There seems to be a problem with your internet connection. Please check your network settings and try again.'**
  String get socketExceptionMessage;

  /// No description provided for @timeoutExceptionMessage.
  ///
  /// In en, this message translates to:
  /// **'The request took too long to complete. Please try again later or check your internet connection.'**
  String get timeoutExceptionMessage;

  /// No description provided for @httpExceptionMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong on the server side. Please try again later or contact our support team.'**
  String get httpExceptionMessage;

  /// No description provided for @formatExceptionMessage.
  ///
  /// In en, this message translates to:
  /// **'There was an issue with the data received from the server. Please try again later or contact our support team.'**
  String get formatExceptionMessage;

  /// No description provided for @ioExceptionMessage.
  ///
  /// In en, this message translates to:
  /// **'There was a problem with the network connection.'**
  String get ioExceptionMessage;

  /// No description provided for @dioConnectTimeoutMessage.
  ///
  /// In en, this message translates to:
  /// **'We\'re having trouble connecting to the server. Please try again later or check your internet connection.'**
  String get dioConnectTimeoutMessage;

  /// No description provided for @dioResponseMessage.
  ///
  /// In en, this message translates to:
  /// **'The server returned an unexpected response. Please try again later or contact our support team.'**
  String get dioResponseMessage;

  /// No description provided for @dioDefaultMessage.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong. Please try again later.'**
  String get dioDefaultMessage;

  /// No description provided for @dioConnectionTimeoutMessage.
  ///
  /// In en, this message translates to:
  /// **'The connection to the server timed out. Please check your internet connection or try again later.'**
  String get dioConnectionTimeoutMessage;

  /// No description provided for @dioSendTimeoutMessage.
  ///
  /// In en, this message translates to:
  /// **'The request timed out while sending data. Please check your internet connection or try again later.'**
  String get dioSendTimeoutMessage;

  /// No description provided for @dioReceiveTimeoutMessage.
  ///
  /// In en, this message translates to:
  /// **'The request timed out while waiting for a response from the server. Please check your internet connection or try again later.'**
  String get dioReceiveTimeoutMessage;

  /// No description provided for @dioBadCertificateMessage.
  ///
  /// In en, this message translates to:
  /// **'The server\'s security certificate is not trusted. Please ensure you\'re using a secure connection or contact our support team.'**
  String get dioBadCertificateMessage;

  /// No description provided for @dioBadResponseMessage.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized access. Please check your credentials or log in again.'**
  String get dioBadResponseMessage;

  /// No description provided for @dioCancelMessage.
  ///
  /// In en, this message translates to:
  /// **'The request was cancelled. Please try again or contact our support team if the issue persists.'**
  String get dioCancelMessage;

  /// No description provided for @dioConnectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'There was a connection error. Please check your internet connection or try again later.'**
  String get dioConnectionErrorMessage;

  /// No description provided for @dioUnknownMessage.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred. Please try again later or contact our support team.'**
  String get dioUnknownMessage;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @loggingIn.
  ///
  /// In en, this message translates to:
  /// **'Logging You in ...'**
  String get loggingIn;

  /// No description provided for @sendingEmail.
  ///
  /// In en, this message translates to:
  /// **'Sending Email ...'**
  String get sendingEmail;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login Success'**
  String get loginSuccess;

  /// No description provided for @resetPasswordEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Reset Password Email Sent'**
  String get resetPasswordEmailSent;

  /// No description provided for @homeScreenMessage.
  ///
  /// In en, this message translates to:
  /// **'What’s In Your Mind Now'**
  String get homeScreenMessage;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @newChat.
  ///
  /// In en, this message translates to:
  /// **'New Chat'**
  String get newChat;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
