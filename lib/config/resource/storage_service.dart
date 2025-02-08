import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _storage = const FlutterSecureStorage();
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;

  StorageService._internal();
  final String _sessionTokenKey = "sessionToken";

  Future<void> setSessionToken(String sessionToken) async {
    try {
      await _storage.write(key: _sessionTokenKey, value: sessionToken);
      print("Token saved securely: $sessionToken");
    } catch (e) {
      print("Error saving token: $e");
    }
  }

  Future<void> deleteSessionToken() async {
    try {
      return await _storage.delete(key: _sessionTokenKey);
    } catch (e) {
      print("Error retrieving token: $e");
      return;
    }
  }

  Future<String?> getSessionToken() async {
    try {
      return await _storage.read(key: _sessionTokenKey);
    } catch (e) {
      print("Error retrieving token: $e");
      return null;
    }
  }

  Future<void> clearStorage() async {
    try {
      await _storage.deleteAll();
      print("Storage cleared successfully!");
    } catch (e) {
      print("Error clearing storage: $e");
    }
  }
}
