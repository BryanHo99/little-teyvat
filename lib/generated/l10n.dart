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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Little Teyvat`
  String get appName {
    return Intl.message(
      'Little Teyvat',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Version {version}`
  String version(Object version) {
    return Intl.message(
      'Version $version',
      name: 'version',
      desc: '',
      args: [version],
    );
  }

  /// `Pyro`
  String get pyro {
    return Intl.message(
      'Pyro',
      name: 'pyro',
      desc: '',
      args: [],
    );
  }

  /// `Hydro`
  String get hydro {
    return Intl.message(
      'Hydro',
      name: 'hydro',
      desc: '',
      args: [],
    );
  }

  /// `Electro`
  String get electro {
    return Intl.message(
      'Electro',
      name: 'electro',
      desc: '',
      args: [],
    );
  }

  /// `Cryo`
  String get cryo {
    return Intl.message(
      'Cryo',
      name: 'cryo',
      desc: '',
      args: [],
    );
  }

  /// `Anemo`
  String get anemo {
    return Intl.message(
      'Anemo',
      name: 'anemo',
      desc: '',
      args: [],
    );
  }

  /// `Geo`
  String get geo {
    return Intl.message(
      'Geo',
      name: 'geo',
      desc: '',
      args: [],
    );
  }

  /// `Dendro`
  String get dendro {
    return Intl.message(
      'Dendro',
      name: 'dendro',
      desc: '',
      args: [],
    );
  }

  /// `Sword`
  String get sword {
    return Intl.message(
      'Sword',
      name: 'sword',
      desc: '',
      args: [],
    );
  }

  /// `Claymore`
  String get claymore {
    return Intl.message(
      'Claymore',
      name: 'claymore',
      desc: '',
      args: [],
    );
  }

  /// `Polearm`
  String get polearm {
    return Intl.message(
      'Polearm',
      name: 'polearm',
      desc: '',
      args: [],
    );
  }

  /// `Catalyst`
  String get catalyst {
    return Intl.message(
      'Catalyst',
      name: 'catalyst',
      desc: '',
      args: [],
    );
  }

  /// `Bow`
  String get bow {
    return Intl.message(
      'Bow',
      name: 'bow',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Characters`
  String get characters {
    return Intl.message(
      'Characters',
      name: 'characters',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Affiliation`
  String get affiliation {
    return Intl.message(
      'Affiliation',
      name: 'affiliation',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message(
      'Birthday',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `Biography`
  String get biography {
    return Intl.message(
      'Biography',
      name: 'biography',
      desc: '',
      args: [],
    );
  }

  /// `CV`
  String get cv {
    return Intl.message(
      'CV',
      name: 'cv',
      desc: '',
      args: [],
    );
  }

  /// `Talents`
  String get talents {
    return Intl.message(
      'Talents',
      name: 'talents',
      desc: '',
      args: [],
    );
  }

  /// `Passives`
  String get passives {
    return Intl.message(
      'Passives',
      name: 'passives',
      desc: '',
      args: [],
    );
  }

  /// `Constellation`
  String get constellation {
    return Intl.message(
      'Constellation',
      name: 'constellation',
      desc: '',
      args: [],
    );
  }

  /// `Constellations`
  String get constellations {
    return Intl.message(
      'Constellations',
      name: 'constellations',
      desc: '',
      args: [],
    );
  }

  /// `Display`
  String get display {
    return Intl.message(
      'Display',
      name: 'display',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Toggle the app's theme to use a darker color palette. Reduces light emission and power consumption.`
  String get darkModeDescription {
    return Intl.message(
      'Toggle the app\'s theme to use a darker color palette. Reduces light emission and power consumption.',
      name: 'darkModeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Change the app's language.`
  String get languageDescription {
    return Intl.message(
      'Change the app\'s language.',
      name: 'languageDescription',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get chinese {
    return Intl.message(
      'Chinese',
      name: 'chinese',
      desc: '',
      args: [],
    );
  }

  /// `Japanese`
  String get japanese {
    return Intl.message(
      'Japanese',
      name: 'japanese',
      desc: '',
      args: [],
    );
  }

  /// `Korean`
  String get korean {
    return Intl.message(
      'Korean',
      name: 'korean',
      desc: '',
      args: [],
    );
  }

  /// `Ascension Stats`
  String get ascensionStats {
    return Intl.message(
      'Ascension Stats',
      name: 'ascensionStats',
      desc: '',
      args: [],
    );
  }

  /// `Ascension Materials`
  String get ascensionMaterials {
    return Intl.message(
      'Ascension Materials',
      name: 'ascensionMaterials',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Base HP`
  String get baseHp {
    return Intl.message(
      'Base HP',
      name: 'baseHp',
      desc: '',
      args: [],
    );
  }

  /// `Base ATK`
  String get baseAtk {
    return Intl.message(
      'Base ATK',
      name: 'baseAtk',
      desc: '',
      args: [],
    );
  }

  /// `Base DEF`
  String get baseDef {
    return Intl.message(
      'Base DEF',
      name: 'baseDef',
      desc: '',
      args: [],
    );
  }

  /// `Rank`
  String get rank {
    return Intl.message(
      'Rank',
      name: 'rank',
      desc: '',
      args: [],
    );
  }

  /// `Materials`
  String get materials {
    return Intl.message(
      'Materials',
      name: 'materials',
      desc: '',
      args: [],
    );
  }

  /// `Talent Stats`
  String get talentStats {
    return Intl.message(
      'Talent Stats',
      name: 'talentStats',
      desc: '',
      args: [],
    );
  }

  /// `Talent Materials`
  String get talentMaterials {
    return Intl.message(
      'Talent Materials',
      name: 'talentMaterials',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Rarity`
  String get rarity {
    return Intl.message(
      'Rarity',
      name: 'rarity',
      desc: '',
      args: [],
    );
  }

  /// `Element`
  String get element {
    return Intl.message(
      'Element',
      name: 'element',
      desc: '',
      args: [],
    );
  }

  /// `Weapon Type`
  String get weaponType {
    return Intl.message(
      'Weapon Type',
      name: 'weaponType',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get error {
    return Intl.message(
      'Something went wrong',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Stack Trace`
  String get stackTrace {
    return Intl.message(
      'Stack Trace',
      name: 'stackTrace',
      desc: '',
      args: [],
    );
  }

  /// `Show Stack Trace`
  String get showStackTrace {
    return Intl.message(
      'Show Stack Trace',
      name: 'showStackTrace',
      desc: '',
      args: [],
    );
  }

  /// `Search by name or element`
  String get searchCharacter {
    return Intl.message(
      'Search by name or element',
      name: 'searchCharacter',
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

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Sort By`
  String get sortBy {
    return Intl.message(
      'Sort By',
      name: 'sortBy',
      desc: '',
      args: [],
    );
  }

  /// `Ascending`
  String get ascending {
    return Intl.message(
      'Ascending',
      name: 'ascending',
      desc: '',
      args: [],
    );
  }

  /// `Descending`
  String get descending {
    return Intl.message(
      'Descending',
      name: 'descending',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
