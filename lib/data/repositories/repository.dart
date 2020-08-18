import 'package:socservice_first_app/data/model/user.dart';
import 'package:socservice_first_app/data/service/providers/user_provaider.dart';

class Repository {
  String token = "";
  //Providers
  UserProvider _userProvider = new UserProvider();
  //Models
  User user;

  Future<bool> initAll() async {
    print('rep: initAll');
    return true;
  }

  Future<bool> getRateById(int id) async {
    return true;
  }

  Future<bool> initUser(String username, String password) async {
    this.user = await _userProvider.getUserID(username, password);
    this.token = "Bearer_" + this.user.token;
    //await LocalUserService.setUser(this.user);
    return true;
  }
}
