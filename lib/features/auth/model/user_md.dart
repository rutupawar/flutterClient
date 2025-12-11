import 'dart:convert';

class UserMd {
  final String name;
  final String email;
  final String id;
  final String token;

  UserMd({
    required this.name,
    required this.email,
    required this.id,
    required this.token,
  });

  UserMd copyWith({String? name, String? email, String? id, String? token}) {
    return UserMd(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'id': id,
      'token': token,
    };
  }

  factory UserMd.fromMap(Map<String, dynamic> map) {
    return UserMd(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserMd.fromJson(String source) =>
      UserMd.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserMd(name: $name, email: $email, id: $id, token: $token)';
  }

  @override
  bool operator ==(covariant UserMd other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.id == id &&
        other.token == token;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ id.hashCode ^ token.hashCode;
  }
}
