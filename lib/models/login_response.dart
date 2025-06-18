class LoginResponse {
  final bool status;
  final String token;
  final User user;

  LoginResponse({
    required this.status,
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] ?? false,
      token: json['token'] ?? '',
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int? id;
  final String? uuid;
  final String? username;
  final String? pass;
  final String? domain;
  final String? domainName;
  final String? subdomain;
  final String? permissions;
  final String? lastLogin;
  final String name;
  final String? realName;
  final String? grantorName;
  final String? userType;
  final String? agentType;
  final String? ledgerType;
  final String? useFor;
  final int? isDefault;
  final String? openingBalance;
  final String? payment;
  final String? closingBalance;
  final String? createdAt;
  final String? updatedAt;
  final String? phone;
  final String? workMode;
  final int? agent;
  final String? address;
  final String? createBy;
  final String? updateBy;
  final int? companyId;
  final String? companyName;
  final int? status;
  final String? main;
  final int? salaryStatus;
  final String? google2faSecret;
  final int? google2faEnable;
  final String? colorCode1;
  final String? colorCode2;
  final String? deleteStatus;
  final int? passChanged;
  final String? sessionId;
  final int? loginAttempt;
  final int? multi;
  final String? salary;
  final String? salaryType;

  User({
    this.id,
    this.uuid,
    this.username,
    this.pass,
    this.domain,
    this.domainName,
    this.subdomain,
    this.permissions,
    this.lastLogin,
    required this.name,
    this.realName,
    this.grantorName,
    this.userType,
    this.agentType,
    this.ledgerType,
    this.useFor,
    this.isDefault,
    this.openingBalance,
    this.payment,
    this.closingBalance,
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.workMode,
    this.agent,
    this.address,
    this.createBy,
    this.updateBy,
    this.companyId,
    this.companyName,
    this.status,
    this.main,
    this.salaryStatus,
    this.google2faSecret,
    this.google2faEnable,
    this.colorCode1,
    this.colorCode2,
    this.deleteStatus,
    this.passChanged,
    this.sessionId,
    this.loginAttempt,
    this.multi,
    this.salary,
    this.salaryType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
      username: json['username'] as String?,
      pass: json['pass'] as String?,
      domain: json['domain'] as String?,
      domainName: json['domain_name'] as String?,
      subdomain: json['subdomain'] as String?,
      permissions: json['permissions'] as String?,
      lastLogin: json['last_login'] as String?,
      name: json['name'] ?? '',
      realName: json['real_name'] as String?,
      grantorName: json['grantor_name'] as String?,
      userType: json['user_type'] as String?,
      agentType: json['agent_type'] as String?,
      ledgerType: json['ledger_type'] as String?,
      useFor: json['use_for'] as String?,
      isDefault: json['is_default'] as int?,
      openingBalance: json['opening_balance'] as String?,
      payment: json['payment'] as String?,
      closingBalance: json['closing_balance'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      phone: json['phone'] as String?,
      workMode: json['work_mode'] as String?,
      agent: json['agent'] as int?,
      address: json['address'] as String?,
      createBy: json['create_by'] as String?,
      updateBy: json['update_by'] as String?,
      companyId: json['company_id'] as int?,
      companyName: json['company_name'] as String?,
      status: json['status'] as int?,
      main: json['main'] as String?,
      salaryStatus: json['salary_status'] as int?,
      google2faSecret: json['google2fa_secret'] as String?,
      google2faEnable: json['google2fa_enable'] as int?,
      colorCode1: json['color_code1'] as String?,
      colorCode2: json['color_code2'] as String?,
      deleteStatus: json['deleteStatus'] as String?,
      passChanged: json['pass_changed'] as int?,
      sessionId: json['session_id'] as String?,
      loginAttempt: json['login_attempt'] as int?,
      multi: json['multi'] as int?,
      salary: json['salary'] as String?,
      salaryType: json['salary_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'username': username,
      'pass': pass,
      'domain': domain,
      'domain_name': domainName,
      'subdomain': subdomain,
      'permissions': permissions,
      'last_login': lastLogin,
      'name': name,
      'real_name': realName,
      'grantor_name': grantorName,
      'user_type': userType,
      'agent_type': agentType,
      'ledger_type': ledgerType,
      'use_for': useFor,
      'is_default': isDefault,
      'opening_balance': openingBalance,
      'payment': payment,
      'closing_balance': closingBalance,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'phone': phone,
      'work_mode': workMode,
      'agent': agent,
      'address': address,
      'create_by': createBy,
      'update_by': updateBy,
      'company_id': companyId,
      'company_name': companyName,
      'status': status,
      'main': main,
      'salary_status': salaryStatus,
      'google2fa_secret': google2faSecret,
      'google2fa_enable': google2faEnable,
      'color_code1': colorCode1,
      'color_code2': colorCode2,
      'deleteStatus': deleteStatus,
      'pass_changed': passChanged,
      'session_id': sessionId,
      'login_attempt': loginAttempt,
      'multi': multi,
      'salary': salary,
      'salary_type': salaryType,
    };
  }
}
