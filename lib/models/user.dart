class User {
  int id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});

  factory User.toObject(Map<String, dynamic> json) =>
      User(id: json['id'], name: json['name'], email: json['email']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
  // static Future<String?> getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("token");
  // }

}
