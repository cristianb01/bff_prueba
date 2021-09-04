class User {
  int? id;
  String? name;
  String? password;

  User({this.id, this.name, this.password});

  factory User.fromJson(json) {
    return User(id: json['id'], name: json['name'], password: json['password']);
  }
}
