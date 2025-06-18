class UserModel {
  final int id;
  final String username;
  final String name;
  final String phone;
  final String userType;
  final String sessionId;
  final String companyName;

  UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.phone,
    required this.userType,
    required this.sessionId,
    required this.companyName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      phone: json['phone'],
      userType: json['user_type'],
      sessionId: json['session_id'],
      companyName: json['company_name'],
    );
  }
}
