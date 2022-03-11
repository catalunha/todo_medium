import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_medium/app/controllers/auth/auth_controller.dart';
import 'package:todo_medium/app/controllers/user/user_service.dart';

class PopMenuPhotoUser extends StatelessWidget {
  AuthController _authController = Get.find();
  final UserDisplayNameVN = ValueNotifier<String>('');
  final UserPhotoUrlVN = ValueNotifier<String>('');

  PopMenuPhotoUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Tooltip(
        message: 'Click para opções',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          // child: const Icon(Icons.ac_unit),
          child: Image.network(
            '${_authController.user?.photoURL ?? "https://www.mktdeafiliados.com.br/wp-content/uploads/2015/02/Como-criar-uma-campanha-com-links-diretos.jpg"}',
            height: 58,
            width: 58,
            errorBuilder: (_, __, ___) {
              return Icon(Icons.person);
            },
          ),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: TextButton.icon(
              label: const Text('Alterar nome'),
              icon: const Icon(Icons.campaign_rounded),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text('Alterar nome'),
                        content: TextField(
                          onChanged: (value) => UserDisplayNameVN.value = value,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              'Cancelar',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: Text('Alterar'),
                            onPressed: () async {
                              if (UserDisplayNameVN.value.isEmpty) {
                                // Messages.of(context)
                                //     .showError('Nome obrigatorio');
                                Get.snackbar('Oops', 'Nome obrigatório',
                                    backgroundColor: Colors.red.withAlpha(50));
                              } else {
                                Get.dialog(
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  barrierDismissible: false,
                                  barrierColor: Colors.red.withAlpha(50),
                                );
                                print('+++> alterar');
                                await Get.find<UserService>()
                                    .updateDisplayName(UserDisplayNameVN.value);
                                print('---> alterar');
                                Get.back(closeOverlays: true);
                              }
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
          PopupMenuItem(
            child: TextButton.icon(
              label: const Text('Alterar foto'),
              icon: const Icon(Icons.person),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text('Alterar link para foto'),
                        content: TextField(
                          onChanged: (value) => UserPhotoUrlVN.value = value,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              'Cancelar',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: Text('Alterar'),
                            onPressed: () async {
                              if (UserPhotoUrlVN.value.isEmpty) {
                                // Messages.of(context)
                                //     .showError('Nome obrigatorio');
                                Get.snackbar(
                                    'Oops', 'Link para foto obrigatório',
                                    backgroundColor: Colors.red.withAlpha(50));
                              } else {
                                Get.dialog(
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  barrierDismissible: false,
                                  barrierColor: Colors.red.withAlpha(50),
                                );
                                await Get.find<UserService>()
                                    .updatePhotoURL(UserPhotoUrlVN.value);
                                Get.back(closeOverlays: true);
                              }
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
          PopupMenuItem(
            child: TextButton.icon(
              label: const Text('Sair'),
              onPressed: () {
                _authController.logout();
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ),
        ];
      },
    );
  }
}
