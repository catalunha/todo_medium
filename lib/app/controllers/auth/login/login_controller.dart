import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/auth/auth_exception.dart';
import 'package:todo_medium/app/controllers/mixins/loader_mixin.dart';
import 'package:todo_medium/app/controllers/mixins/message_mixin.dart';
import 'package:todo_medium/app/controllers/user/user_service.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final UserService _userService;
  LoginController({required UserService userService})
      : _userService = userService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> loginGoogle() async {
    try {
      _loading(true);
      final user = await _userService.loginGoogle();
      if (user != null) {
        //success
      } else {
        _userService.logout();
        _message.value = MessageModel(
          title: 'Erro',
          message: 'Em escolher conta do Google',
          isError: true,
        );
      }
    } on AuthException catch (e) {
      _userService.logout();
      _message.value = MessageModel(
        title: 'AuthException',
        message: 'Em escolher conta do Google',
        isError: true,
      );
    } finally {
      _loading(false);
    }
  }

  Future<void> loginEmail(String email, String password) async {
    try {
      _loading(true);
      final user =
          await _userService.loginEmail(email: email, password: password);
      if (user != null) {
        //success
      } else {
        _message.value = MessageModel(
          title: 'Erro',
          message: 'Usuário ou senha inválidos.',
          isError: true,
        );
      }
    } on AuthException catch (e) {
      _loading(false);
      _message.value = MessageModel(
        title: 'Oops',
        message: e.message,
        isError: true,
      );
    } finally {
      _loading(false);
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      final user = await _userService.forgotPassword(email);
      _message.value = MessageModel(
        title: 'Erro',
        message: 'orientações sobre recuperação de senha ',
      );
    } on AuthException catch (e) {
      _userService.logout();
      _message.value = MessageModel(
        title: 'AuthException',
        message: 'Em recuperar senha',
        isError: true,
      );
    }
  }
}
