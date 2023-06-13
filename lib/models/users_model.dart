import '../services/users.service.dart';

class User {
  String id;
  String email;
  String password;
  String username;
  String bio;
  int age;
  String job;
  String phoneNum;
  String profileImage;
  bool isFirstTime;

  User(this.id, this.email, this.password, this.username, this.bio, this.age,
      this.job, this.phoneNum, this.profileImage, this.isFirstTime);

  Future<User> fetchData() async {
    String? id = await UserService().getUser("id");
    String? email = await UserService().getUser("email");
    String? password = await UserService().getUser("password");
    String? isFirstTimeString = await UserService().getUser("isFirstTime");
    bool? isFirstTime = isFirstTimeString?.toLowerCase() == 'true';
    this.id = id!;
    this.email = email!;
    this.password = password!;
    this.isFirstTime = isFirstTime;
    if (isFirstTime) {
      username = "";
      bio = "";
      age = 0;
      job = "";
      phoneNum = "";
      profileImage = "";
    } else {
      String? username = await UserService().getUser("username");
      String? bio = await UserService().getUser("bio");
      int? age = int.parse(await UserService().getUser("age") as String);
      String? job = await UserService().getUser("job");
      String? phoneNum = await UserService().getUser("phoneNum");
      String? profileImage = await UserService().getUser("profileImage");
      this.username = username!;
      this.bio = bio!;
      this.age = age;
      this.job = job!;
      this.phoneNum = phoneNum!;
      this.profileImage = profileImage!;
    }

    return User(id, email, password, username, bio, age, job, phoneNum,
        profileImage, isFirstTime);
  }
}
