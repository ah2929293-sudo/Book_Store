import 'package:book_store/core/networking/api_constants.dart';
import 'package:book_store/core/networking/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.login,
        data: {"email": email, "password": password},
      );
      if (response?.statusCode == 200) {
        saveUserToken(response?.data["data"]["token"]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<void> saveUserToken(token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    // AppConstants.token = token;
  }

  static Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
  }) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.register,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": password_confirmation,
        },
      );
      if (response?.statusCode == 201) {
        saveUserToken(response?.data["data"]["token"]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
