import 'package:flutter/foundation.dart';

class AppConstants {
  static const String appName = 'Penny Go';
  
  // Dynamic Base URL
  static const String baseUrl = kDebugMode 
      ? 'http://localhost:3000/api' // Use 10.0.2.2 for Android Emulator
      : 'https://penny-go-api.onrender.com/api'; 
  
  // Storage Keys
  static const String tokenKey = 'jwt_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
}
