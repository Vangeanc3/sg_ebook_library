class User {
  String id;
  String name;
  String email;
  String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = (map['name']),
        password = map['password'],
        email = (map['email']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'email': email,
    };
  }

  User copyWith({
    required String id,
    String? name,
    String? email,
    String? password,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
