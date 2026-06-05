class DixbaseBusiness {
  final String id;
  final String businessName;
  final String businessEmail;
  final String businessUrl;
  final String? businessWebhookSuccess;
  final String? businessWebhookCanceled;
  final String? businessWebhookExpired;
  final String? telegramNotificationChannelId;
  final DateTime createdAt;
  final String url;
  final String apiKey;

  DixbaseBusiness({
    required this.id,
    required this.businessName,
    required this.businessEmail,
    required this.businessUrl,
    this.businessWebhookSuccess,
    this.businessWebhookCanceled,
    this.businessWebhookExpired,
    this.telegramNotificationChannelId,
    required this.createdAt,
    required this.url,
    required this.apiKey,
  });

  factory DixbaseBusiness.fromJson(Map<String, dynamic> json) {
    return DixbaseBusiness(
      id: json['id'] as String,
      businessName: json['business_name'] as String,
      businessEmail: json['business_email'] as String,
      businessUrl: json['business_url'] as String,
      businessWebhookSuccess: json['business_webhook_success'] as String?,
      businessWebhookCanceled: json['business_webhook_canceled'] as String?,
      businessWebhookExpired: json['business_webhook_expired'] as String?,
      telegramNotificationChannelId:
          json['telegram_notification_channel_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      url: json['url'] as String,
      apiKey: json['api_key'] as String,
    );
  }
}
