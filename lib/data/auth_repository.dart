import 'dart:convert';
import '../models/user_model.dart';
import '../services/api_service.dart';
import '../utils/constants.dart';

class AuthRepository {
  final ApiService _api;

  AuthRepository(this._api);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _api.dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    
    if (response.statusCode == 200) {
      final data = response.data['data'];
      await _saveTokens(data['accessToken'], data['refreshToken']);
      await _saveUser(data['user']);
      return data;
    }
    throw Exception('Login failed');
  }

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final response = await _api.dio.post('/auth/register', data: {
      'name': name,
      'email': email,
      'password': password,
    });

    if (response.statusCode == 201) {
      final data = response.data['data'];
      await _saveTokens(data['accessToken'], data['refreshToken']);
      await _saveUser(data['user']);
      return data;
    }
    throw Exception('Registration failed');
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    await _api.storage.write(key: AppConstants.tokenKey, value: accessToken);
    await _api.storage.write(key: AppConstants.refreshTokenKey, value: refreshToken);
  }

  Future<void> _saveUser(Map<String, dynamic> user) async {
    await _api.storage.write(key: AppConstants.userDataKey, value: jsonEncode(user));
  }

  Future<UserModel?> getStoredUser() async {
    final userJson = await _api.storage.read(key: AppConstants.userDataKey);
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  Future<void> logout() async {
    await _api.storage.deleteAll();
  }
}
