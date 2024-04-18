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
