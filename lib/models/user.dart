// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int id;
  String username;
  String email;
  bool empresa;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.empresa,
  });
  

  User copyWith({
    int? id,
    String? username,
    String? email,
    bool? empresa,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      empresa: empresa ?? this.empresa,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'empresa': empresa,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
      empresa: ((map['empresa'] == 1) ? true : false),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, empresa: $empresa)';
  }
}
