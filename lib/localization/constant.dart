import 'package:flutter/material.dart';
import 'package:flutter_multi_bahasa/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefSelectedLanguageCode = "language";

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(prefSelectedLanguageCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(prefSelectedLanguageCode) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  return languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : const Locale('en', '');
}

void changeLanguage(BuildContext context, String selectedLanguageCode) async {
  Locale locale = await setLocale(selectedLanguageCode);
  MyApp.setLocale(context, locale);
}
