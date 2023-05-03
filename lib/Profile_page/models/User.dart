class User {
  String id, name, phone, email, imageUrl;
  DateTime createdAt;

  User({
    required this.createdAt, 
    required this.id, 
    required this.name, 
    required this.phone, 
    required this.email, 
    required this.imageUrl});
}
