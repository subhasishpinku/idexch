class LoginResponse {
  final bool status;
  final String token;
  final User user;

  LoginResponse({required this.status, required this.token, required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      token: json['token'] ?? '',
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String name;
  final String username;

  User({required this.id, required this.name, required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
    );
  }
}
