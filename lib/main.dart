import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:storeit/Localization/custom_localization.dart';
import 'package:storeit/Localization/get_translat.dart';
import 'package:storeit/routers/constants_route.dart';
import 'package:storeit/routers/custom_route.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  //this widget is the root of your application
  //setLocale
  // This method identifies the new state for [ Local local ]
  static Future<void> setLocale(BuildContext context, Locale locale) async{
    _MyAppState state =  context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //initial Locale locale
  Locale _locale;

  // use this method
  // To change the language
  // and used this method above method name setLocale on state
  void setLocale(Locale locale){
   setState(() {
     _locale = locale;
   });
  }
  // Change Dependencies
  @override
  void didChangeDependencies() {
    // use Locale getter from SharedPreferences
    getLocale().then((locale){
      setState(() {
        // _locale be equal locale value
        // this value it's coming from getLocale method
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null){
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }else{
      return MaterialApp(
        title: 'Locale Lange',
        locale: _locale,
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        localizationsDelegates: [
          //use my custom delegate
          CustomLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // check deviceLocal And supportedLocales
        // Are equal In the localeCode and countryCode
        // If they are equal
        // return deviceLocal
        // otherwise
        // return supportedLocales.first
        localeResolutionCallback: (deviceLocale, supportedLocales){
          for(var locale in supportedLocales){
            if(locale.languageCode == deviceLocale.languageCode && locale.countryCode == deviceLocale.countryCode){
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        onGenerateRoute: CustomRoute.allRoutes,
        initialRoute: loginRoute,
        debugShowCheckedModeBanner: false,
      );
    }
  }
}