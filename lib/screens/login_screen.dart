import 'package:flutter/material.dart';
import 'package:storeit/Functionality/language.dart';
import 'package:storeit/Localization/get_translat.dart';
import 'package:storeit/SharedWidgets/custom_logo.dart';
import 'package:storeit/SharedWidgets/custom_textfield.dart';
import 'package:storeit/SharedWidgets/custom_validate.dart';
import 'package:storeit/constants.dart';
import 'package:storeit/main.dart';
import 'package:storeit/routers/constants_route.dart';


class LoginScreen extends StatefulWidget {
  static String id ='LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final bool autoValidate =false ;

  final bool enabled = true;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: SMainColor,
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            CustomLogo(
              title: getTranslated(context, 'T_logo'),
              customHeight: 0.17,
              fontFamily: 'Pacifico',
              fontSize: 25.0,
              imagePath: 'images/icons/shop100.png',
            ),
            SizedBox(
              height: height * 0.1,
            ),
            CustomField(
              enabled: enabled,
              autoValidate: autoValidate,
              hint: getTranslated(context, 'T_email'),
              isEmail: true,
              icon: Icons.email,
              customValidate: emailValidate,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomField(
              enabled: enabled,
              autoValidate: autoValidate,
              hint: getTranslated(context, 'T_password'),
              isPassword: true,
              icon: Icons.lock,
              customValidate: passwordValidate,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.black,
                child: Text(
                  getTranslated(context, 'T_login'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: (){
                  _formKey.currentState.validate();
                },
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                   getTranslated(context, 'T_line_login'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, registerRoute);
                  },
                  child: Text(
                    getTranslated(context, 'T_sign_up'),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () async {
//                        Language language;
                          for(var lang in Language.langList()){
                            Locale _temp = await setLocale(lang.langCode);
                            MyApp.setLocale( context, _temp);
                          }

                      },
                      child: Text('EN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async{
//                        Language language;
                          for(var lang in Language.langList()){
                            Locale _temp = await setLocale(lang.langCode);
                            MyApp.setLocale( context, _temp);
                          }

                      },
                      child: Text('العربية',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



