import 'dart:convert';
import 'package:first_task/ApiData/product.dart';
import 'package:http/http.dart' as http;
Future<List<Product>> fetchApiProducts() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<dynamic> productsJson = data['products'];
    return productsJson.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}