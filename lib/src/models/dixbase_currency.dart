import 'package:dixbase_sdk/src/models/dixbase_blockchain.dart';

class DixbaseCurrency {
  final String id;
  final String name;
  final String ticker;
  final String symbol;
  final int decimals;
  final double value;
  final bool isFiat;
  final String apiId;
  final List<DixbaseBlockchain> blockchainsAvailable;

  DixbaseCurrency({
    required this.id,
    required this.name,
    required this.ticker,
    required this.symbol,
    required this.decimals,
    required this.value,
    required this.isFiat,
    required this.apiId,
    required this.blockchainsAvailable,
  });

  factory DixbaseCurrency.fromJson(Map<String, dynamic> json) {
    return DixbaseCurrency(
      id: json['id'] as String,
      name: json['name'] as String,
      ticker: json['ticker'] as String,
      symbol: json['symbol'] as String,
      decimals: json['decimals'] as int,
      value: (json['value'] as num).toDouble(),
      isFiat: json['is_fiat'] as bool,
      apiId: json['api_id'] as String,
      blockchainsAvailable: (json['blockchains_available'] as List)
          .map((e) => DixbaseBlockchain.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
