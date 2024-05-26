import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:handocs_app/app/interactor/actions/perfil_action.dart';
import 'package:handocs_app/app/interactor/atoms/perfil_atom.dart';
import 'package:handocs_app/app/interactor/models/perfil_model.dart';
import 'package:routefly/routefly.dart';
import '../components/button.dart';
import '../helpers/constants.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  String _textEntrar = 'ENTRAR';

  void _gotoLogin() {
    setState(() {
      _textEntrar = 'Aguarde...';
      fetchPerfils().then((value) {
        _textEntrar = 'ENTRAR';

        final perfis = perfilState.value;

        if (perfis.length == 0) {
          Routefly.push('register');
          return;
        }

        PerfilModel perfil = perfis.first;

        if (perfil.codigoAcesso != null) {
          Routefly.push('login');
          return;
        }

        if (!perfil.biometria) {
          Routefly.push('login');
          return;
        } else {
          //TODO: Implementar Biometria
          //throw UnimplementedError();
        }

        Routefly.push('home');

      }, onError: (e) {
        _textEntrar = 'ENTRAR';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary,title: Text(widget.title),),
      body: Container(
          alignment: Alignment.center,
          //color: Colors.black87,
          decoration: BoxDecoration(
            color: HDColor.bodyBackground,
            image: DecorationImage(
              image: const AssetImage("assets/images/hex.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.12), BlendMode.dstATop),
            ),
          ),
          child: Column(children: [
            const SizedBox(width: 30, height: 180),
            const Image(
              image: AssetImage('assets/images/logo.png'),
              width: 250,
              height: 250,
            ),
            const SizedBox(width: 30, height: 80),
            HDButton.defaultButton(_textEntrar, _gotoLogin),
            //const SizedBox(width: 70, height: 20),
            //HDButton.defaultButton('CADASTRAR', _gotoLogin),
          ])),
    );
  }
}
