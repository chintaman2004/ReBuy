import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String base = dotenv.env['API_BASE_URL'] ?? 'http://10.0.2.2:4445';

  Future<List<dynamic>> getProducts() async {
    final res = await http.get(Uri.parse('$base/api/products'));
    if (res.statusCode == 200) {
      return json.decode(res.body) as List<dynamic>;
    }
    throw Exception('Failed to load products');
  }

  Future<Map<String, dynamic>> getProduct(String id) async {
    final res = await http.get(Uri.parse('$base/api/products/$id'));
    if (res.statusCode == 200) {
      return json.decode(res.body) as Map<String, dynamic>;
    }
    throw Exception('Failed to load product');
  }

  Future<Map<String, dynamic>> createOrder(Map<String, dynamic> payload) async {
    final res = await http.post(Uri.parse('$base/api/orders'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(payload));
    if (res.statusCode == 201) {
      return json.decode(res.body) as Map<String, dynamic>;
    }
    throw Exception('Failed to create order');
  }
}
