import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:handocs_app/app/interactor/atoms/perfil_atom.dart';
import '../components/text.dart';
import '../components/appbar.dart';
import '../components/button.dart';
import 'package:routefly/routefly.dart';

import '../helpers/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  String _labelErro = '';

  void _login() {
    setState(() {

      final perfil = perfilState.value[0];

      _labelErro = '';

      if (senhaController.text == perfil.senha &&
          emailController.text.toUpperCase().trim() ==
              perfil.email.toUpperCase().trim()) {
        Routefly.push('home');
      } else {
        _labelErro = "Usuário ou senha incorretos!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final perfil = perfilState.value[0];

    emailController.text = perfil.email;
    senhaController.text = perfil.senha;

    return RxBuilder(builder: (_) {
      return Scaffold(
        appBar:
            HDAppBar.defaultAppBar(context, 'ACESSO A APLICAÇÃO', false, true),
        body: Container(
            alignment: Alignment.center ,
            //color: Colors.black87,
            decoration: BoxDecoration(
              color: HDColor.bodyBackground,
              image: DecorationImage(
                image: const AssetImage("images/hexagonos_digitais.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.12), BlendMode.dstATop),
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HDText.defaultInputText(
                      'Usuário ou e-mail',
                      false,
                      const EdgeInsets.fromLTRB(30, 50, 30, 10),
                      emailController,
                      TextCapitalization.sentences),
                  HDText.defaultInputText(
                      'Senha',
                      true,
                      const EdgeInsets.fromLTRB(30, 5, 30, 10),
                      senhaController),
                  Text(
                    _labelErro,
                    style: TextStyle(color: HDColor.labelError),
                  ),
                  SizedBox.fromSize(size: const Size(10, 20)),
                  Text(
                    "Esqueci a senha!",
                    style: TextStyle(color: HDColor.bronzeLight),
                  ),
                  SizedBox.fromSize(size: const Size(10, 20)),
                  HDButton.defaultButton('LOG IN', _login),
                  //const Divider(color: Colors.grey),
                  //SizedBox.fromSize(size: const Size(10, 30)),
                  //HDButton.defaultButton('FACEBOOK', _gotoHome),
                  //SizedBox.fromSize(size: const Size(10, 20)),
                  //HDButton.defaultButton('TWITTER', _gotoHome),
                  //SizedBox.fromSize(size: const Size(10, 20)),
                  //HDButton.defaultButton('GOOGLE', _login),
                ])),
      );
    });
  }
}
