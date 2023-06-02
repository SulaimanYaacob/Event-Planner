class User {
  final String username;
  final String password;
  final String name;
  final String role;
  final int age;
  final String phonenum;
  final String bio;
  final String image;

  User(
      {required this.username,
      required this.password,
      required this.name,
      required this.role,
      required this.age,
      required this.phonenum,
      required this.bio,
      required this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        password: json['password'],
        name: json['name'],
        role: json['role'],
        age: json['age'],
        phonenum: json['phone_number'],
        bio: json['bio'],
        image: json['image']);
  }
}
