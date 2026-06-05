class DixbaseBlockchain {
  final String id;
  final String name;
  final String symbol;

  DixbaseBlockchain({
    required this.id,
    required this.name,
    required this.symbol,
  });

  factory DixbaseBlockchain.fromJson(Map<String, dynamic> json) {
    return DixbaseBlockchain(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
    );
  }
}
