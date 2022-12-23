class Car {
  const Car({
    required this.image,
    required this.brand,
    required this.model,
    required this.price,
    required this.km,
    required this.color,
    required this.state,
    required this.details,
  });

  factory Car.fromMAP(Map<String, dynamic> json) {
    return Car(
      image: json['image'],
      brand: json['brand'],
      model: json['model'],
      price: json['price'],
      km: json['km'],
      color: json['color'],
      state: json['state'],
      details: json['details'],
    );
  }

  final String image;
  final String brand;
  final String model;
  final String price;
  final String km;
  final String color;
  final String state;
  final String details;
}
