class TasbhAzker {
  final String category;
  int count;  // Changed to mutable
  final String description;
  final String reference;
  final String content;

  TasbhAzker({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory TasbhAzker.fromJson(Map<String, dynamic> json) {
    return TasbhAzker(
      category: json['category'],
      count: int.parse(json['count']),
      description: json['description'],
      reference: json['reference'],
      content: json['content'],
    );
  }

  void decrementCount() {
    if (count > 0) {
      count--;
    }
  }
}
