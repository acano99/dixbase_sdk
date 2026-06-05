class DixbaseWebhookPayload {
  final String event;
  final String invoiceId;
  final double amount;
  final String currency;
  final String blockchain;
  final String status;
  final DateTime paidAt;
  final String clientEmail;

  DixbaseWebhookPayload({
    required this.event,
    required this.invoiceId,
    required this.amount,
    required this.currency,
    required this.blockchain,
    required this.status,
    required this.paidAt,
    required this.clientEmail,
  });

  factory DixbaseWebhookPayload.fromJson(Map<String, dynamic> json) {
    return DixbaseWebhookPayload(
      event: json['event'] as String,
      invoiceId: json['invoice_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      blockchain: json['blockchain'] as String,
      status: json['status'] as String,
      paidAt: DateTime.parse(json['paid_at'] as String),
      clientEmail: json['client_email'] as String,
    );
  }
}
