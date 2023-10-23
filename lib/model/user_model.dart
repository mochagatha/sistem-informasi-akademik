class UserModel {
    String jwt;
    User user;

    UserModel({
        required this.jwt,
        required this.user,
    });

}

class User {
    int id;
    String username;
    String email;
    String provider;
    bool confirmed;
    bool blocked;
    DateTime createdAt;
    DateTime updatedAt;
     String nip;

    User({
        required this.id,
        required this.username,
        required this.email,
        required this.provider,
        required this.confirmed,
        required this.blocked,
        required this.createdAt,
        required this.updatedAt,
        required this.nip,
    });

}
