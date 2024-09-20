import 'package:flutter/material.dart';
import 'package:flutter_multi_bahasa/language/languages.dart';
import 'package:flutter_multi_bahasa/model/language_model.dart';

import '../localization/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            Languages.of(context)!.appName,
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
                Text(
                  Languages.of(context)!.welcomeText,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  Languages.of(context)!.appDescription,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 70,
                ),
                _dropDownLanguange()
              ],
            ),
          ),
        ),
      );

  _dropDownLanguange() {
    return DropdownButton<LanguageModel>(
      iconSize: 30,
      hint: Text(Languages.of(context)!.selectLanguage),
      onChanged: (LanguageModel? language) {
        changeLanguage(context, language!.languageCode);
      },
      items: LanguageModel.languageList()
          .map<DropdownMenuItem<LanguageModel>>(
            (e) => DropdownMenuItem<LanguageModel>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.country,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(e.languageName),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
