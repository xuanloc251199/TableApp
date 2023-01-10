class AuthRequest {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  AuthRequest({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
  });
}
