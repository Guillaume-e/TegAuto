class User {
  const User ({
    required this.name,
    required this.imagePath,
    required this.email,
    required this.isAdmin,
  });
  final String name;
  final String imagePath;
  final String email;
  final bool isAdmin;
}