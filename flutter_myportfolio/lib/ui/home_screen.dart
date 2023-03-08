import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/main_controller.dart';
import '../helpers/sizes.dart';
import '../model/language_enum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MainController mainController = Get.find();
  IconData _iconDataThemeLight = Icons.wb_sunny;
  IconData _iconDataThemeDark = Icons.nights_stay;
  ThemeData _lightTheme =
      ThemeData(primarySwatch: Colors.orange, brightness: Brightness.light);
  ThemeData _darkTheme =
      ThemeData(primarySwatch: Colors.pink, brightness: Brightness.dark);
  double deviceWidth = Sizes.getWidth();
  double deviceHeight = Sizes.getHeight();
  @override
  Widget build(BuildContext context) {
    // Bu sayede ekran boyutu her değiştiğinde Sizes class'ı sayesinde Mediaquery boyutu değişecektir.
    Sizes.setSizes(context);
    deviceWidth = Sizes.getWidth();
    deviceHeight = Sizes.getHeight();
    return Obx(() => MaterialApp(
        theme: mainController.darkThemeBool.value ? _darkTheme : _lightTheme,
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
                separator(),
                marginWidget(marginWidth: 0, marginHeight: 50),
                aboutMyselfShort(),
                marginWidget(marginWidth: 0, marginHeight: 50),
                aboutMyself(),
                marginWidget(marginWidth: 0, marginHeight: 50),
              ],
            ),
          ),
        )));
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
                marginWidget(marginWidth: 0, marginHeight: 20),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.orange,
                ),
                marginWidget(marginWidth: 0, marginHeight: 20),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.yellow,
                )
              ],
            ),
            marginWidget(marginWidth: 10, marginHeight: 0),
            Column(
              children: [
                marginWidget(marginWidth: 0, marginHeight: 20),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.red,
                ),
                marginWidget(marginWidth: 0, marginHeight: 20),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.orange,
                ),
                marginWidget(marginWidth: 0, marginHeight: 20),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.yellow,
                )
              ],
            ),
            marginWidget(marginWidth: 10, marginHeight: 0),
            Column(
              children: [
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.red,
                ),
                marginWidget(marginWidth: 0, marginHeight: 20),
                Container(
                  width: _width / 3 - 20,
                  height: deviceHeight / 3 - 40,
                  color: Colors.orange,
                ),
                marginWidget(marginWidth: 0, marginHeight: 20),
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
        color: mainController.darkThemeBool.value
            ? Colors.deepPurple.shade900
            : Colors.yellow,
        child: Text(
          "topInfoBanner".tr,
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
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: deviceWidth / 50 + deviceHeight / 50,
                    fontWeight: FontWeight.bold),
              )),
          Text("Altunkaynak",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: deviceWidth / 50 + deviceHeight / 50,
                    fontWeight: FontWeight.bold),
              )),
          Text("computerEngineer".tr,
              style: GoogleFonts.prompt(
                textStyle: TextStyle(
                  fontSize: deviceWidth / 70 + deviceHeight / 70,
                ),
              )),
          Text("mobileDeveloper".tr,
              style: GoogleFonts.prompt(
                textStyle: TextStyle(
                  fontSize: deviceWidth / 70 + deviceHeight / 70,
                ),
              )),
        ],
      ),
    ));
  }

  languagesDropdownButton() {
    return DropdownButton(
      underline: SizedBox(),
      focusColor: Colors.transparent,
      value: mainController.selectedLanguage.value,
      items: languages.values.map((languages selectedLanguage) {
        return DropdownMenuItem<languages>(
            value: selectedLanguage,
            child: Text(selectedLanguage.name.toString()));
      }).toList(),
      onChanged: (var newValue) {
        mainController.selectedLanguage.value = newValue!;
        switch (mainController.selectedLanguage.value.name) {
          case 'tr':
            var locale = Locale('tr');
            Get.updateLocale(locale);
            break;
          case 'en':
            var locale = Locale('en');
            Get.updateLocale(locale);
            break;
          default:
        }
      },
    );
  }

  themeIconButton() {
    return IconButton(
      onPressed: () {
        mainController.darkThemeBool.value =
            !mainController.darkThemeBool.value;
      },
      icon: Icon(mainController.darkThemeBool.value
          ? _iconDataThemeDark
          : _iconDataThemeLight),
    );
  }

  aboutMyself() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("aboutMyselfLong1".tr,
                    style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                          fontSize: deviceWidth / 120 + deviceHeight / 120,
                          wordSpacing: 5),
                    )),
                marginWidget(marginWidth: 0, marginHeight: 10),
                Text("aboutMyselfLong2".tr,
                    style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                          fontSize: deviceWidth / 120 + deviceHeight / 120,
                          wordSpacing: 5),
                    )),
                marginWidget(marginWidth: 0, marginHeight: 10),
                Text("aboutMyselfLong3".tr,
                    style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                          fontSize: deviceWidth / 120 + deviceHeight / 120,
                          wordSpacing: 5),
                    )),
                marginWidget(marginWidth: 0, marginHeight: 10),
                Text("aboutMyselfLong4".tr,
                    style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                          fontSize: deviceWidth / 120 + deviceHeight / 120,
                          wordSpacing: 5),
                    )),
                marginWidget(marginWidth: 0, marginHeight: 10),
                Text("aboutMyselfLong5".tr,
                    style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                          fontSize: deviceWidth / 120 + deviceHeight / 120,
                          wordSpacing: 5),
                    )),
                marginWidget(marginWidth: 0, marginHeight: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        iconSize: deviceWidth / 50 + deviceHeight / 50,
                        onPressed: () {
                          launchUrl(Uri.parse(
                              'https://github.com/abdullah-altunkaynak'));
                        },
                        icon: Icon(
                          FontAwesomeIcons.github,
                        )),
                    marginWidget(marginWidth: 20, marginHeight: 0),
                    IconButton(
                        iconSize: deviceWidth / 50 + deviceHeight / 50,
                        onPressed: () {
                          launchUrl(Uri.parse(
                              'https://www.linkedin.com/in/abdullah-altunkaynak-443ab7215/'));
                        },
                        icon: Icon(
                          FontAwesomeIcons.linkedin,
                        )),
                    marginWidget(marginWidth: 20, marginHeight: 0),
                    IconButton(
                        iconSize: deviceWidth / 50 + deviceHeight / 50,
                        onPressed: () {
                          launchUrl(Uri.parse(
                              'https://medium.com/@altunkaynakabdullah99'));
                        },
                        icon: Icon(
                          FontAwesomeIcons.medium,
                        ))
                  ],
                )
              ],
            )),
        Flexible(
            flex: 2,
            child: CircleAvatar(
              radius: deviceHeight / 12 + deviceWidth / 12,
              backgroundImage: NetworkImage(
                  "https://media.licdn.com/dms/image/D4D03AQGDaXOLmvn5_w/profile-displayphoto-shrink_800_800/0/1664302066432?e=1683763200&v=beta&t=4uNyXkwrtC3RhrPSaHeaj-Ez1fOWI8nGOiRqQUn4gHk"),
            ))
      ],
    );
  }

  separator() {
    return Center(
      // Separator
      child: Container(
        width: deviceWidth - 50,
        height: 1,
        color: Colors.grey,
      ),
    );
  }

  aboutMyselfShort() {
    return Center(
      child: Container(
        width: deviceWidth / 1.3,
        child: Text(
          "aboutMyselfShort".tr,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
          style: GoogleFonts.sono(
            textStyle: TextStyle(
                fontSize: deviceWidth / 110 + deviceHeight / 110,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  marginWidget({double marginWidth = 0, double marginHeight = 0}) {
    return SizedBox(
      width: marginWidth,
      height: marginHeight,
    );
  }
}
