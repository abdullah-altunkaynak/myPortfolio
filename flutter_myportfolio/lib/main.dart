import 'package:flutter/material.dart';

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

class _MyPortfolioState extends State<MyPortfolio> {
  bool _darkThemeBool = false;
  IconData _iconDataThemeLight = Icons.wb_sunny;
  IconData _iconDataThemeDark = Icons.nights_stay;
  ThemeData _lightTheme =
      ThemeData(primarySwatch: Colors.orange, brightness: Brightness.light);
  ThemeData _darkTheme =
      ThemeData(primarySwatch: Colors.pink, brightness: Brightness.dark);
  double deviceWidth = 0;
  double deviceHeight = 0;
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
                    mainRightSidePersonalInfo(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _darkThemeBool = !_darkThemeBool;
                        });
                      },
                      icon: Icon(_darkThemeBool
                          ? _iconDataThemeDark
                          : _iconDataThemeLight),
                    ),
                  ],
                )
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
          "Bu uygulama/site Flutter teknolojisi kullanılarak yapılmıştır.",
          style: TextStyle(fontSize: deviceWidth / 120 + deviceHeight / 120),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  mainRightSidePersonalInfo() {
    return Center(
        child: Container(
      height: deviceHeight,
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
          Text("Bilgisayar Mühendisi /",
              style: TextStyle(
                fontSize: deviceWidth / 70 + deviceHeight / 70,
              )),
          Text("Mobile Developer",
              style: TextStyle(
                fontSize: deviceWidth / 70 + deviceHeight / 70,
              )),
        ],
      ),
    ));
  }
}
