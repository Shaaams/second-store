import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLocalization {
  //Local property => Basically coming from flutter_localizations.dart Embedded in it
  final Locale locale;
  //create constructor it
  CustomLocalization(this.locale);

  // singleton pattern
  static CustomLocalization of(BuildContext context){
    return Localizations.of<CustomLocalization>(context, CustomLocalization);
  }
  //initial Map her name _LocalValue to load data from json files after convert it to String values
  // Look at the method load below
  Map<String, String> _localeValue;

  // ============================================================= //
  //Load values Languages from json files on assets in the future
  // this method in order to access the value in a json file
  // by lib services.dart using rootBundle.loadString to load String Value
  // rootBundle.loadString => Dealing with files from asset
  Future load() async {
    String jsonStringValues =
    //local => from this class constructor
    //bath lang json file = 'lib/lang/${locale.languageCode}.json'
    await rootBundle.loadString('lib/lang/${locale.languageCode}.json');
    //After fetching the values from json files in the variable json String Values which from String type
    //We have to convert the values from json files
    // Into values of type String Through the library dart:convert
    Map<String, dynamic> valueFromJsonFile = jsonDecode(jsonStringValues);
    //MapEntry : this method coming from lib dart-core
    // this method her jop received map and return values it after convert to key string , value string
    //Then we assign it to the variable _localeValue of type map <string, string>
    _localeValue = valueFromJsonFile.map((key , value)=> MapEntry(key, value.toString()));
    // now we have this localized values inside this variable => _LocalValue

  }
  // this method take put parameter String value and return value type String
  // via data inside this map => _LocalValue returns value a key that was entered to this method
  String getTranslateValue(String key){
    return _localeValue[key];
  }
  // now create method delegate
  // this method after create class _CustomLocalizationDelegate
  //used class _CustomLocalizationDelegate as a member in this class
  static const LocalizationsDelegate<CustomLocalization> delegate =
  _CustomLocalizationDelegate();

// now go to maim.dart and create my custom delegate

}

// ============================================================================= //
// Now we have to create a class delegate inherits from class LocalizationsDelegate
// Be of type this above class <CustomLocalization>
// Then we must implement three methods
// first => isSupported from type bool
// second => load from type future<CustomLocalization>
//third  => shouldReload from type bool
class _CustomLocalizationDelegate extends LocalizationsDelegate<CustomLocalization>{
  const _CustomLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    //this method
    //Checks that the language code values are in
    //the local map supportedLocales Previously defined in the main.dart
    //or not
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<CustomLocalization> load(Locale locale) async {
    //this method
    //
    CustomLocalization localization = CustomLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<CustomLocalization> old) => false;

}