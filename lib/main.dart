import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkys/screen/app_guide.dart';
import 'package:talkys/screen/home.dart';
import 'package:talkys/screen/main_menu.dart';
import 'package:talkys/screen/speak_training.dart';
import 'package:talkys/screen/speech_to_text.dart';
import 'package:talkys/screen/welcome.dart';
import 'package:talkys/service/preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => PreferencesService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Talkys',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/main-menu",
      getPages: [
        GetPage(
          name: "/main-menu",
          page: () {
            return MainMenuPage();
          },
        ),
        GetPage(
          name: "/welcome",
          page: () {
            return WelcomePage();
          },
        ),
        GetPage(
          name: "/home",
          page: () {
            return HomePage();
          },
        ),
        GetPage(
          name: "/app-guide",
          page: () {
            return AppGuidePage();
          },
        ),
        GetPage(
          name: "/speaking-training",
          page: () {
            return SpeakTrainingPage();
          },
        ),
        GetPage(
          name: "/speech-to-text",
          page: () {
            return SpeechToText();
          },
        ),
      ],
    );
  }
}
