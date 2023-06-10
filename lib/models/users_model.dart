import '../services/users.service.dart';

class User {
  String? id;
  String? email;
  String? password;
  String? username;
  String? bio;
  String? age;
  String? job;
  String? phoneNum;
  String? profileImage;

  User(this.id, this.email, this.password);

  Future<User> fetchData() async {
    String? id = await UserService().getUser("id");
    String? email = await UserService().getUser("email");
    String? password = await UserService().getUser("password");
    this.id = id;
    this.email = email;
    this.password = password;

    return User(id, email, password);
  }

  void firstTimeUserDetail(String dataType, String dataValue) {}
}
