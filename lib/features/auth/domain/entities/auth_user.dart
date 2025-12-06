/// 認証されたユーザーのドメインエンティティ。
class AuthUser {
  final int id;
  final String nickname;
  final String email;
  final String role;
  final bool isGuest;

  const AuthUser({
    required this.id,
    required this.nickname,
    required this.email,
    required this.role,
    required this.isGuest,
  });
}


