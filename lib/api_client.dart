import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final http.Client _client;

  ApiClient({required this.baseUrl, http.Client? client})
    : _client = client ?? http.Client();

  Future<T> get<T>(
    String path, {
    required T Function(dynamic json) mapper,
    Map<String, String>? headers,
  }) async {
    final response = await _client.get(
      Uri.parse('$baseUrl$path'),
      headers: {
        'Accept': 'application/json',
        'User-Agent': 'Mozilla/5.0',
        ...?headers,
      },
    );

    if (response.statusCode == 200) {
      return mapper(jsonDecode(response.body));
    } else {
      throw Exception('GET $path failed — status ${response.statusCode}');
    }
  }

  Future<T> post<T>(
    String path, {
    required T Function(dynamic json) mapper,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    final response = await _client.post(
      Uri.parse('$baseUrl$path'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'User-Agent': 'Mozilla/5.0',
        ...?headers,
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return mapper(jsonDecode(response.body));
    } else {
      throw Exception('POST $path failed — status ${response.statusCode}');
    }
  }
}
