import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkys/service/preferences_service.dart';

class HomeGreetingComponent extends StatelessWidget {
  final prefs = Get.find<PreferencesService>();
  HomeGreetingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.value(prefs.getUserName()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            "Halo, ...!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 48.0,
              fontWeight: FontWeight.w900,
            ),
          );
        }

        final name = snapshot.data ?? "Anak Hebat";
        return Text(
          "Halo, $name!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.0,
            fontWeight: FontWeight.w900,
          ),
        );
      },
    );
  }
}
