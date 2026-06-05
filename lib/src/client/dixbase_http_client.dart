import 'dart:convert';
import 'package:dixbase_sdk/src/client/endpoints.dart';
import 'package:http/http.dart' as http;

class DixbaseHttpClient {
  final String apiKey;
  final http.Client _client;

  DixbaseHttpClient({required this.apiKey}) : _client = http.Client();

  Map<String, String> get _headers => {
    'x-dix-auth': apiKey,
    'Content-Type': 'application/json',
  };

  Future<http.Response> get(String path) async {
    final uri = Uri.parse('${Endpoints.baseUrl}$path');
    return await _client.get(uri, headers: _headers);
  }

  Future<http.Response> post(String path, {Map<String, dynamic>? body}) async {
    final uri = Uri.parse('${Endpoints.baseUrl}$path');
    return await _client.post(
      uri,
      headers: _headers,
      body: body != null ? jsonEncode(body) : null,
    );
  }

  void close() {
    _client.close();
  }
}
