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
//     static const _cartItems="cartItems";

//  static Future<void> saveCartItems(List <OrderItem>? cartItems) async {
//     final prefs=await SharedPreferences.getInstance();
//     String jsonString=jsonEncode(cartItems);
//     await prefs.setString(_cartItems, jsonString);
//   }
//   static Future<List <OrderItem>?> getCartItems() async{
//     final prefs= await SharedPreferences.getInstance();
//     String? jsonString=prefs.getString(_cartItems);
//     if(jsonString==null) return [];
//     List decoded=jsonDecode(jsonString);
//     return decoded.cast<OrderItem>();
//   }
   static Future<void> clearUserImagee() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userImage);
  }
   static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey,);
    await prefs.remove(_userImage,);
    await prefs.remove(_userName,);
  }
}