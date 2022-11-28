import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/services/model.dart';
import 'package:http/http.dart' as http;

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<User> getUser() async {
    try {
      final response =
          await http.get(Uri.parse("https://random-data-api.com/api/v2/users"));
      return User.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}
