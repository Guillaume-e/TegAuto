class Car {
  const Car({
    required this.image,
    required this.brand,
    required this.model,
    required this.price,
    required this.km,
    required this.color,
    required this.year,
    required this.details,
    required this.engine,
  });

  factory Car.fromJSON(Map<String, dynamic> json) {
    return Car(
      image: json['Image'],
      brand: json['Brand'],
      model: json['Model'],
      price: json['Price'],
      km: json['Km'],
      color: json['Color'],
      year: json['Year'],
      details: json['Details'],
      engine: json['Engine'],
    );
  }

  final String image;
  final String brand;
  final String model;
  final String price;
  final String km;
  final String color;
  final String year;
  final String details;
  final String engine;
}
