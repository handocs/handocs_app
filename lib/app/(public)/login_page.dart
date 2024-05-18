import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          HDAppBar.defaultAppBar(context, 'ACESSO A APLICAÇÃO', false, true),
      body: Container(
          alignment: Alignment.center,
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
          child: Column(children: [
            HDText.defaultInputText('Usuário ou e-mail', false,
                const EdgeInsets.fromLTRB(30, 50, 30, 0)),
            HDText.defaultInputText(
                'Senha', true, const EdgeInsets.fromLTRB(30, 5, 30, 0)),
            SizedBox.fromSize(size: const Size(10, 50)),
            Text("Esqueci a senha!", style: TextStyle(color: HDColor.bronzeLight),),
            HDButton.defaultButton('LOG IN', _gotoHome),
            SizedBox.fromSize(size: const Size(10, 30)),
            Text("Não sou cadastrado! Quero me cadastrar!", style: TextStyle(color: HDColor.bronzeLight),),
            const Divider(color: Colors.grey),
            SizedBox.fromSize(size: const Size(10, 30)),
            HDButton.defaultButton('FACEBOOK', _gotoHome),
            SizedBox.fromSize(size: const Size(10, 20)),
            //HDButton.defaultButton('TWITTER', _gotoHome),
            //SizedBox.fromSize(size: const Size(10, 20)),
            HDButton.defaultButton('GOOGLE', _gotoHome),
          ])),
    );
  }

  void _gotoHome() {
    Routefly.push('home');
  }
}
