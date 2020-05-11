import 'package:flutter/cupertino.dart';
import 'package:storeit/Localization/custom_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String key){
  return CustomLocalization.of(context).getTranslateValue(key);
}

// language Code
const String ENGLISH = 'en';
const String ARABIC = 'ar';

// create constant Key
const String LANGUAGE_CODE = 'langCode';

// setter Locale
Future<Locale> setLocale(String langCode)async{
  SharedPreferences _shPref = await SharedPreferences.getInstance();
 await _shPref.setString(LANGUAGE_CODE, langCode);
 return _locale(langCode);
}

// create Locale
Locale _locale (String langCode){
  Locale _temp;
  switch(langCode){
    case ENGLISH:
     _temp = Locale(ENGLISH, 'US');
    break;
    case ARABIC:
      _temp = Locale(ARABIC, 'EG');
      break;
    default:
      _temp = Locale(ENGLISH, 'US');
      break;
  }
 return _temp;
}

// getter Locale
Future<Locale> getLocale() async {
  SharedPreferences _shPref = await SharedPreferences.getInstance();
  String langCode = _shPref.getString(LANGUAGE_CODE)?? ENGLISH;
  return _locale(langCode);
}