// --- Data Model ---
class Whisky {
  final String name;
  final String year;
  final String number;
  final String imageUrl;
  final String quantity;
  final Map<String, dynamic> details; // Use Map for flexible details

  Whisky({
    required this.name,
    required this.year,
    required this.number,
    required this.imageUrl,
    required this.quantity,
    required this.details,
  });

  factory Whisky.fromJson(Map<String, dynamic> json) {
    return Whisky(
      name: json['name'],
      year: json['year'],
      number: json['number'],
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
      details: json['details'],
    );
  }
}