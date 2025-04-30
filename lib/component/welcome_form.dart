import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkys/service/preferences_service.dart';

class WelcomeFormComponent extends StatefulWidget {
  const WelcomeFormComponent({super.key});

  @override
  State<WelcomeFormComponent> createState() => _WelcomeFormComponentState();
}

class _WelcomeFormComponentState extends State<WelcomeFormComponent> {
  final _formKey = GlobalKey<FormState>();
  final _userNameInputController = TextEditingController();
  final prefs = Get.find<PreferencesService>();

  @override
  void dispose() {
    _userNameInputController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final name = _userNameInputController.text.trim();

      await prefs.setUserName(name);

      Get.snackbar(
        "Selamat Datang!",
        "Salam kenal $name",
        backgroundColor: Colors.blueAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Get.toNamed("/home");
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 48.0,
      ),
      child: Form(
          key: _formKey,
          child: Column(
            spacing: 24.0,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xBB000000),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _userNameInputController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Text("Masuk"),
                ),
              ),
            ],
          )),
    );
  }
}
