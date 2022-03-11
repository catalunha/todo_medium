import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/auth/auth_exception.dart';
import 'package:todo_medium/app/controllers/mixins/loader_mixin.dart';
import 'package:todo_medium/app/controllers/mixins/message_mixin.dart';
import 'package:todo_medium/app/controllers/user/user_service.dart';

class RegisterController extends GetxController with LoaderMixin, MessageMixin {
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final UserService _userService;
  RegisterController({required UserService userService})
      : _userService = userService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _userService.register(
        email: email,
        password: password,
      );
      _loading(true);
      if (user != null) {
        //success
      } else {
        _userService.logout();
        _message.value = MessageModel(
          title: 'Erro',
          message: 'Em registrar usuário',
          isError: true,
        );
      }
    } on AuthException catch (e) {
      _userService.logout();
      _message.value = MessageModel(
        title: 'AuthException',
        message: 'Em registrar usuário',
        isError: true,
      );
    } finally {
      _loading(false);
    }
  }
}
