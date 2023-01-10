import '../../data/request/auth_request.dart';
import '../../models/user.dart';

abstract class AuthRepositories {
  Future<User> onAuth(AuthRequest request, String url);
}
