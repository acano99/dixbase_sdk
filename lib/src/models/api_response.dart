class DixbaseListResponse<T> {
  final String object;
  final bool hasMore;
  final List<T> data;

  DixbaseListResponse({
    required this.object,
    required this.hasMore,
    required this.data,
  });

  factory DixbaseListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return DixbaseListResponse(
      object: json['object'] as String,
      hasMore: json['has_more'] as bool,
      data: (json['data'] as List)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
