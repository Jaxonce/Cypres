import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class HashPasswordUtils {
  static Future<String> hashPassword(String password) async {
    final salt = await _generateSalt();
    final hash = await _hashPassword(password, salt);
    return '$hash.$salt';
  }

  static Future<bool> verifyPassword(String password, String hashedPassword) async {
    final parts = hashedPassword.split('.');
    final hash = parts[0];
    final salt = parts[1];
    final newHash = await _hashPassword(password, salt);
    return newHash == hash;
  }

  static Future<String> _generateSalt() async {
    final random = Random.secure();
    final salt = List<int>.generate(16, (_) => random.nextInt(256));
    return base64Url.encode(salt);
  }

  static Future<String> _hashPassword(String password, String salt) async {
    final key = utf8.encode(password);
    final bytes = utf8.encode(salt);
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);
    return base64Url.encode(digest.bytes);
  }
}