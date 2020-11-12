import 'package:galinha_karoot/app/modules/common/BaseAuth.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'welcome_controller.g.dart';

class WelcomeController = _WelcomeBase with _$WelcomeController;

abstract class _WelcomeBase with Store {
  _WelcomeBase() {
    getUserRole();
  }

  @observable
  bool isLoggedIn = true;
  String name = '';

  @action
  Future<String> getUserRole() async {
    String role = await Auth().getUserRole();
    return role;
  }

  autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');

    if (userId != null) {
      return true;
    }
    return false;
  }

  loginUser(String a) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', a);
  }
}
