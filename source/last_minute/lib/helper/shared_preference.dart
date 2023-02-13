
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class SPController {
  setUserId(value) {
    prefs.setString('user_id', value);
  }

  getUserId() {
    return prefs.getString('user_id');
  }

  setIsLoggedin(value) {
    prefs.setBool('is_login', value);
  }

  getIsLoggedin() {
    var value = prefs.getBool('is_login');
    if (value == null) {
      return false;
    }
    return value;
  }
}
