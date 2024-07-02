// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `////////////////////////////////////////////////////////////////`
  String get onBoardingScreenSection {
    return Intl.message(
      '////////////////////////////////////////////////////////////////',
      name: 'onBoardingScreenSection',
      desc: '',
      args: [],
    );
  }

  /// `SKIP`
  String get skip {
    return Intl.message(
      'SKIP',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `BACK`
  String get back {
    return Intl.message(
      'BACK',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get next {
    return Intl.message(
      'NEXT',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `GET START`
  String get getStart {
    return Intl.message(
      'GET START',
      name: 'getStart',
      desc: '',
      args: [],
    );
  }

  /// `Manage your tasks`
  String get title1 {
    return Intl.message(
      'Manage your tasks',
      name: 'title1',
      desc: '',
      args: [],
    );
  }

  /// `You can easily manage all of your daily tasks in DoMe for free`
  String get subtitle1 {
    return Intl.message(
      'You can easily manage all of your daily tasks in DoMe for free',
      name: 'subtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Create daily routine`
  String get title2 {
    return Intl.message(
      'Create daily routine',
      name: 'title2',
      desc: '',
      args: [],
    );
  }

  /// `In Uptodo  you can create your personalized routine to stay productive`
  String get subtitle2 {
    return Intl.message(
      'In Uptodo  you can create your personalized routine to stay productive',
      name: 'subtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Orgonaize your tasks`
  String get title3 {
    return Intl.message(
      'Orgonaize your tasks',
      name: 'title3',
      desc: '',
      args: [],
    );
  }

  /// `You can organize your daily tasks by adding your tasks into separate categories`
  String get subtitle3 {
    return Intl.message(
      'You can organize your daily tasks by adding your tasks into separate categories',
      name: 'subtitle3',
      desc: '',
      args: [],
    );
  }

  /// `////////////////////////////////////////////////////////////////`
  String get WelcomeScreen {
    return Intl.message(
      '////////////////////////////////////////////////////////////////',
      name: 'WelcomeScreen',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to UpTodo`
  String get welcomeToUpTodo {
    return Intl.message(
      'Welcome to UpTodo',
      name: 'welcomeToUpTodo',
      desc: '',
      args: [],
    );
  }

  /// `Please login to your account or create new account to continue`
  String get welcomeTitle {
    return Intl.message(
      'Please login to your account or create new account to continue',
      name: 'welcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get login {
    return Intl.message(
      'LOGIN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `CREATE ACCOUNT`
  String get createAccount {
    return Intl.message(
      'CREATE ACCOUNT',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `////////////////////////////////////////////////////////////////`
  String get signInSection {
    return Intl.message(
      '////////////////////////////////////////////////////////////////',
      name: 'signInSection',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your account`
  String get PleaseVerifyYourAccount {
    return Intl.message(
      'Please verify your account',
      name: 'PleaseVerifyYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Failure!`
  String get failure {
    return Intl.message(
      'Failure!',
      name: 'failure',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `You are poor android user!!!!`
  String get poorAndroid {
    return Intl.message(
      'You are poor android user!!!!',
      name: 'poorAndroid',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get loginWithApple {
    return Intl.message(
      'Login with Apple',
      name: 'loginWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// ` Register`
  String get register {
    return Intl.message(
      ' Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your e-mail`
  String get enterEmail {
    return Intl.message(
      'Enter your e-mail',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Password`
  String get enterPassword {
    return Intl.message(
      'Enter your Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `////////////////////////////////////////////////////////////////`
  String get signUpSection {
    return Intl.message(
      '////////////////////////////////////////////////////////////////',
      name: 'signUpSection',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get success {
    return Intl.message(
      'Success!',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Register with Google`
  String get registerWithGoogle {
    return Intl.message(
      'Register with Google',
      name: 'registerWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Register with Apple`
  String get registerWithApple {
    return Intl.message(
      'Register with Apple',
      name: 'registerWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Your Password`
  String get confirmYourPassword {
    return Intl.message(
      'Confirm Your Password',
      name: 'confirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `SignIn`
  String get SignIn {
    return Intl.message(
      'SignIn',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `////////////////////////////////////////////////////////////////`
  String get homeSection {
    return Intl.message(
      '////////////////////////////////////////////////////////////////',
      name: 'homeSection',
      desc: '',
      args: [],
    );
  }

  /// `index`
  String get index {
    return Intl.message(
      'index',
      name: 'index',
      desc: '',
      args: [],
    );
  }

  /// `Calender`
  String get Calender {
    return Intl.message(
      'Calender',
      name: 'Calender',
      desc: '',
      args: [],
    );
  }

  /// `Focus`
  String get Focus {
    return Intl.message(
      'Focus',
      name: 'Focus',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to do today?`
  String get WhatDoYouWantToDoToday {
    return Intl.message(
      'What do you want to do today?',
      name: 'WhatDoYouWantToDoToday',
      desc: '',
      args: [],
    );
  }

  /// `Tap + to add your tasks`
  String get tapToAdd {
    return Intl.message(
      'Tap + to add your tasks',
      name: 'tapToAdd',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Add Task`
  String get addTask {
    return Intl.message(
      'Add Task',
      name: 'addTask',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get task {
    return Intl.message(
      'Task',
      name: 'task',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Task Description`
  String get taskDescription {
    return Intl.message(
      'Task Description',
      name: 'taskDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tasks Left`
  String get tasksLeft {
    return Intl.message(
      'Tasks Left',
      name: 'tasksLeft',
      desc: '',
      args: [],
    );
  }

  /// `Tasks Done`
  String get tasksDone {
    return Intl.message(
      'Tasks Done',
      name: 'tasksDone',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Delete Task`
  String get deleteTask {
    return Intl.message(
      'Delete Task',
      name: 'deleteTask',
      desc: '',
      args: [],
    );
  }

  /// `////////////////////////////////////////////////////////////////`
  String get profileSection {
    return Intl.message(
      '////////////////////////////////////////////////////////////////',
      name: 'profileSection',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Change Account Password`
  String get changeAccountPassword {
    return Intl.message(
      'Change Account Password',
      name: 'changeAccountPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Old Password`
  String get enterOldPassword {
    return Intl.message(
      'Enter Old Password',
      name: 'enterOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enterNewPassword {
    return Intl.message(
      'Enter New Password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Old Password `
  String get oldPassword {
    return Intl.message(
      'Old Password ',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password `
  String get newPassword {
    return Intl.message(
      'New Password ',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `this filed is required`
  String get filedRequired {
    return Intl.message(
      'this filed is required',
      name: 'filedRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password length is less than 8`
  String get passwordShort {
    return Intl.message(
      'Password length is less than 8',
      name: 'passwordShort',
      desc: '',
      args: [],
    );
  }

  /// `Two password can't be the same`
  String get passwordSame {
    return Intl.message(
      'Two password can\'t be the same',
      name: 'passwordSame',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Successfully`
  String get passwordChangedSuccessfully {
    return Intl.message(
      'Password Changed Successfully',
      name: 'passwordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Failure`
  String get passwordChangedFailure {
    return Intl.message(
      'Password Changed Failure',
      name: 'passwordChangedFailure',
      desc: '',
      args: [],
    );
  }

  /// `Password is Wrong`
  String get wrongPassword {
    return Intl.message(
      'Password is Wrong',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Error, Please Try Again Latter`
  String get unexpectedError {
    return Intl.message(
      'Unexpected Error, Please Try Again Latter',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Focus Mood`
  String get focusTimer {
    return Intl.message(
      'Focus Mood',
      name: 'focusTimer',
      desc: '',
      args: [],
    );
  }

  /// `Set Timer`
  String get setTimer {
    return Intl.message(
      'Set Timer',
      name: 'setTimer',
      desc: '',
      args: [],
    );
  }

  /// `Pause`
  String get pause {
    return Intl.message(
      'Pause',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Seconds`
  String get seconds {
    return Intl.message(
      'Seconds',
      name: 'seconds',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this task?`
  String get areYouSure {
    return Intl.message(
      'Are you sure you want to delete this task?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Edit Task`
  String get editTask {
    return Intl.message(
      'Edit Task',
      name: 'editTask',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Change account Image`
  String get changeImage {
    return Intl.message(
      'Change account Image',
      name: 'changeImage',
      desc: '',
      args: [],
    );
  }

  /// `Change account Name`
  String get changeName {
    return Intl.message(
      'Change account Name',
      name: 'changeName',
      desc: '',
      args: [],
    );
  }

  /// `Name can't be less than two`
  String get nameIsLessThanTwo {
    return Intl.message(
      'Name can\'t be less than two',
      name: 'nameIsLessThanTwo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
