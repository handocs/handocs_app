import 'package:flutter/material.dart';
import 'package:handocs_app/app/components/text.dart';
import 'package:handocs_app/app/helpers/constants.dart';

import '../components/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: HDColor.AppBarBackground,
          title: Text(
            "Acesso a aplicação",
            style: TextStyle(
                fontSize: 16,
                color: HDColor.AppBarText,
                fontWeight: FontWeight.bold),
          )),
      body: Container(
          alignment: Alignment.center,
          //color: Colors.black87,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: const AssetImage("images/hexagonos_digitais.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.12), BlendMode.dstATop),
            ),
          ),
          child: Column(children: [
            HDText.defaultInputText(
                'Usuário ou e-mail', const EdgeInsets.fromLTRB(30, 50, 30, 0)),
            HDText.defaultInputText(
                'Senha', const EdgeInsets.fromLTRB(30, 5, 30, 0)),
            SizedBox.fromSize(size: const Size(10, 50)),
            HDButton.defaultButton('LOG IN'),
            SizedBox.fromSize(size: const Size(10, 30)),
            const Divider(color: Colors.grey),
            SizedBox.fromSize(size: const Size(10, 30)),
            HDButton.defaultButton('FACEBOOK'),
            HDButton.defaultButton('TWITTER'),
            HDButton.defaultButton('GOOGLE'),
          ])),
    );
  }
}
