class UserDetailsModel {
  final String uid;
  final String email;
  final int coins;
  final String username;
  final String lastLogin;

  UserDetailsModel({
    required this.uid,
    required this.email,
    required this.coins,
    required this.username,
    required this.lastLogin
  });

  // Factory constructor to create a UserModel from Realtime Database data
  factory UserDetailsModel.fromRealtimeDatabase(String uid, Map<String, dynamic> data) {
    return UserDetailsModel(
      uid: uid,
      email: data['email'] as String? ?? '',
      coins: data['coins'] as int? ?? 0,
      username: data['name'] as String? ?? '',
      lastLogin: data['lastLogin'] as String? ?? '',
    );
  }

  // Optional: To convert the model to a map for easier Realtime Database writing
  
}
