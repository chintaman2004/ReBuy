import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  late final String base;
  ApiService() {
    final web = dotenv.env['API_BASE_URL_WEB'];
    final app = dotenv.env['API_BASE_URL'];
    base = kIsWeb
        ? (web ?? 'http://localhost:4445')
        : (app ?? 'http://10.0.2.2:4445');
    // debug print
    // ignore: avoid_print
    print('API base = $base');
  }

  Future<List<dynamic>> getProducts() async {
    final res = await http.get(Uri.parse('$base/api/products'));
    if (res.statusCode == 200) {
      final decoded = json.decode(res.body);
      if (decoded is List) return decoded;
      throw Exception('Expected a JSON array but got: ${decoded.runtimeType}');
    }
    throw Exception(
        'GET /products failed: ${res.statusCode} ${res.reasonPhrase}');
  }

  Future<Map<String, dynamic>> getProduct(String id) async {
    final res = await http.get(Uri.parse('$base/api/products/$id'));
    if (res.statusCode == 200) {
      return json.decode(res.body) as Map<String, dynamic>;
    }
    throw Exception('GET /products/$id failed: ${res.statusCode}');
  }

  Future<Map<String, dynamic>> createOrder(Map<String, dynamic> payload) async {
    final res = await http.post(
      Uri.parse('$base/api/orders'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(payload),
    );
    if (res.statusCode == 201) {
      return json.decode(res.body) as Map<String, dynamic>;
    }
    throw Exception('POST /orders failed: ${res.statusCode}');
  }
}
