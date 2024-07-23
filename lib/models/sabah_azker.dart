class SabahAzker {
  final String category;
  int count;  // Changed to mutable
  final String description;
  final String reference;
  final String content;

  SabahAzker({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory SabahAzker.fromJson(Map<String, dynamic> json) {
    return SabahAzker(
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
