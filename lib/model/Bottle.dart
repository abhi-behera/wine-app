class Bottle {
  final String image;
  final String title;
  final String age;
  final int quantity;
  final int totalQuantity;

  Bottle({
    required this.image,
    required this.title,
    required this.age,
    required this.quantity,
    required this.totalQuantity,
  });

  factory Bottle.fromJson(Map<String, dynamic> json) {
    return Bottle(
      image: json['image'],
      title: json['title'],
      age: json['age'],
      quantity: json['quantity'],
      totalQuantity: json['totalQuantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'age': age,
      'quantity': quantity,
      'totalQuantity': totalQuantity,
    };
  }
}
