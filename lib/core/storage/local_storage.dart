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
  static const _userImage="userImage";

  static Future<void> saveUserImage(String userImage) async {
    final prefs=await SharedPreferences.getInstance();
    await prefs.setString(_userImage, userImage);
  }

  static Future<String?> getUserImage() async{
    final prefs= await SharedPreferences.getInstance();
    return prefs.getString(_userImage);
  }
   static Future<void> clearUserImagee() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userImage);
  }
}