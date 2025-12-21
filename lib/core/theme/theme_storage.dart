import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  ThemeStorage(this._prefs);

  final SharedPreferences _prefs;

  static const String _key = 'theme_mode'; // 'light' | 'dark'

  String? readMode() => _prefs.getString(_key);

  Future<void> writeMode(String mode) async {
    await _prefs.setString(_key, mode);
  }
}


