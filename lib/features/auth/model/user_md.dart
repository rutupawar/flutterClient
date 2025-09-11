import 'dart:convert';

class UserMd {
  final String name;
  final String email;
  final String id;

  UserMd({required this.name, required this.email, required this.id});

  UserMd copyWith({String? name, String? email, String? id}) {
    return UserMd(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'email': email, 'id': id};
  }

  factory UserMd.fromMap(Map<String, dynamic> map) {
    return UserMd(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserMd.fromJson(String source) =>
      UserMd.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserMd(name: $name, email: $email, id: $id)';

  @override
  bool operator ==(covariant UserMd other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ id.hashCode;
}
