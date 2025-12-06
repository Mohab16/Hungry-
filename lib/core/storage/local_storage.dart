import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const _tokenKey='token';
  static Future <void> saveToken(String token) async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);

  }

  static Future<String?> getToken()async {
    final prefs=await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
    
  }
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  static const _userName="userName";

  static Future<void> saveUserName(String userName) async {
    final prefs=await SharedPreferences.getInstance();
    await prefs.setString(_userName, userName);
  }

  static Future<String?> getUserName() async{
    final prefs= await SharedPreferences.getInstance();
    return prefs.getString(_userName);
  }
   static Future<void> clearUserName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userName);
  }
}