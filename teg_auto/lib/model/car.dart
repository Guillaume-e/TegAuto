class Car {
  const Car({
    required this.id,
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
      id: json['Id'],
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

  Map<String, dynamic> toJSON() => <String, dynamic>{
        "Id": id,
        "Image": image,
        "Brand": brand,
        "Model": model,
        "Price": price,
        "Km": km,
        "Color": color,
        "Year": year,
        "Details": details,
        "Engine": engine
      };

  final String id;
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
