import 'dart:convert';
import 'package:dixbase_sdk/src/client/dixbase_http_client.dart';
import 'package:dixbase_sdk/src/models/api_response.dart';
import 'package:dixbase_sdk/src/models/dixbase_business.dart';
import 'package:dixbase_sdk/src/models/dixbase_currency.dart';
import 'package:dixbase_sdk/src/models/dixbase_invoice.dart';
import 'endpoints.dart';

class DixbaseClient {
  final DixbaseHttpClient _httpClient;

  DixbaseClient({required String apiKey})
    : _httpClient = DixbaseHttpClient(apiKey: apiKey);

  Future<DixbaseInvoice> createInvoice({
    required double amount,
    required String currency,
    String? currencyChain,
    String? chargeCurrency,
    String? clientEmail,
    String? idempotencyKey,
  }) async {
    final body = {
      'amount': amount,
      'currency': currency,
      'currency_chain': ?currencyChain,
      'charge_currency': ?chargeCurrency,
      'client_email': ?clientEmail,
      'idempotency_key': ?idempotencyKey,
    };

    final response = await _httpClient.post('', body: body);

    if (response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return DixbaseInvoice.fromJson(data);
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  Future<List<DixbaseInvoice>> listInvoices() async {
    final response = await _httpClient.get('');

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => DixbaseInvoice.fromJson(json)).toList();
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  Future<DixbaseInvoice> getInvoice(String id) async {
    final response = await _httpClient.get('/$id');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return DixbaseInvoice.fromJson(data);
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  Future<List<DixbaseCurrency>> listCurrencies() async {
    final response = await _httpClient.get(Endpoints.listCurrencies);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      final listResponse = DixbaseListResponse<DixbaseCurrency>.fromJson(
        jsonMap,
        (json) => DixbaseCurrency.fromJson(json),
      );
      return listResponse.data;
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  Future<DixbaseBusiness> getBusiness() async {
    final response = await _httpClient.get(Endpoints.getBusiness);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return DixbaseBusiness.fromJson(data);
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  void close() {
    _httpClient.close();
  }
}
