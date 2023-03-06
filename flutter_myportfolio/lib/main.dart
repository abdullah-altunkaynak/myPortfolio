import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    home: MyPortfolio(),
  ));
}

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({super.key});
  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

enum languages { en, tr }

class _MyPortfolioState extends State<MyPortfolio> {
  @override
  void initState() {
    super.initState();
    print("initState çalıştı");
    readJson();
  }

  bool _darkThemeBool = false;
  languages selectedLanguage = languages.tr;
  IconData _iconDataThemeLight = Icons.wb_sunny;
  IconData _iconDataThemeDark = Icons.nights_stay;
  ThemeData _lightTheme =
      ThemeData(primarySwatch: Colors.orange, brightness: Brightness.light);
  ThemeData _darkTheme =
      ThemeData(primarySwatch: Colors.pink, brightness: Brightness.dark);
  double deviceWidth = 0;
  double deviceHeight = 0;
  var texts;
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Abdullah Altunkaynak',
        theme: _darkThemeBool ? _darkTheme : _lightTheme,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                topInfoBanner(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    mainImagesGrid(),
                    Container(
                      width: deviceWidth - deviceWidth / 1.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              languagesDropdownButton(),
                              themeIconButton()
                            ],
                          ),
                          mainRightSidePersonalInfo(),
                        ],
                      ),
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: deviceWidth - 50,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: deviceWidth / 1.3,
                    child: Text(
                      texts[selectedLanguage.name]["aboutMyselfShort"]
                          .toString(),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: deviceWidth / 120 + deviceHeight / 120),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                        flex: 2,
                        child: Column(
                          children: [Text("")],
                        )),
                    Flexible(flex: 1, child: Container())
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  mainImagesGrid() {
    var _width = deviceWidth / 1.5;
    return Container(
        padding: EdgeInsets.only(top: 10),
        width: _width,
        height: deviceHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.orange,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.yellow,
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.orange,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.yellow,
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.orange,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.yellow,
                )
              ],
            )
          ],
        ));
  }

  topInfoBanner() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(5),
        width: deviceWidth,
        color: _darkThemeBool ? Colors.deepPurple.shade900 : Colors.yellow,
        child: Text(
          texts[selectedLanguage.name]["topInfoBanner"],
          style: TextStyle(fontSize: deviceWidth / 120 + deviceHeight / 120),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  mainRightSidePersonalInfo() {
    return Center(
        child: Container(
      height: deviceHeight - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Abdullah",
              style: TextStyle(
                fontSize: deviceWidth / 50 + deviceHeight / 50,
              )),
          Text("Altunkaynak",
              style: TextStyle(
                fontSize: deviceWidth / 50 + deviceHeight / 50,
              )),
          Text("${texts[selectedLanguage.name]["computerEngineer"]} /",
              style: TextStyle(
                fontSize: deviceWidth / 70 + deviceHeight / 70,
              )),
          Text("${texts[selectedLanguage.name]["mobileDeveloper"]} /",
              style: TextStyle(
                fontSize: deviceWidth / 70 + deviceHeight / 70,
              )),
        ],
      ),
    ));
  }

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/texts/texts.json');
    final data = await json.decode(response);
    print(data.toString());
    setState(() {
      texts = data;
    });
  }

  languagesDropdownButton() {
    return DropdownButton(
      value: selectedLanguage,
      items: languages.values.map((languages selectedLanguage) {
        return DropdownMenuItem<languages>(
            value: selectedLanguage,
            child: Text(selectedLanguage.name.toString()));
      }).toList(),
      onChanged: (var newValue) {
        setState(() {
          selectedLanguage = newValue!;
        });
      },
    );
  }

  themeIconButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          _darkThemeBool = !_darkThemeBool;
        });
      },
      icon: Icon(_darkThemeBool ? _iconDataThemeDark : _iconDataThemeLight),
    );
  }
}
