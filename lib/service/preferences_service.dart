import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService extends GetxService {
  late SharedPreferences _prefs;

  Future<PreferencesService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  String? getUserName() => _prefs.getString('user_name');

  Future<bool> setUserName(String name) => _prefs.setString('user_name', name);
}