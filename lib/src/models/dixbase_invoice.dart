class DixbaseInvoice {
  final String id;
  final String url;
  final String address;
  final String? addressExtra;
  final double amount;
  final String currency;
  final String blockchain;
  final String status;
  final DateTime? paidAt;
  final String? clientEmail;

  DixbaseInvoice({
    required this.id,
    required this.url,
    required this.address,
    this.addressExtra,
    required this.amount,
    required this.currency,
    required this.blockchain,
    required this.status,
    this.paidAt,
    this.clientEmail,
  });

  factory DixbaseInvoice.fromJson(Map<String, dynamic> json) {
    return DixbaseInvoice(
      id: json['id'] as String,
      url: json['url'] as String,
      address: json['address'] as String,
      addressExtra: json['address_extra'] as String?,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      blockchain: json['blockchain'] as String,
      status: json['status'] as String,
      paidAt: json['paid_at'] != null
          ? DateTime.parse(json['paid_at'] as String)
          : null,
      clientEmail: json['client_email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'address': address,
      if (addressExtra != null) 'address_extra': addressExtra,
      'amount': amount,
      'currency': currency,
      'blockchain': blockchain,
      'status': status,
      if (paidAt != null) 'paid_at': paidAt!.toIso8601String(),
      if (clientEmail != null) 'client_email': clientEmail,
    };
  }
}
