import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:handocs_app/app/interactor/actions/perfil_action.dart';
import 'package:handocs_app/app/interactor/atoms/perfil_atom.dart';
import 'package:handocs_app/app/interactor/models/perfil_model.dart';
import '../components/text.dart';
import '../components/appbar.dart';
import '../components/button.dart';
import 'package:routefly/routefly.dart';

import '../helpers/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  String _labelErro = '';

  void _registrar() {
    setState(() {

      _labelErro = '';

      if (_nomeController.text.trim() == '') {
        _labelErro = 'Favor preencher o campo nome.';
        return;
      }
      if (_emailController.text.trim() == '') {
        _labelErro = 'Favor preencher o campo e-mail.';
        return;
      }
      if (!_emailController.text.trim().contains('@') ||
          !_emailController.text.trim().contains('.')) {
        _labelErro = 'Formato do campo e-mail inválido.';
        return;
      }

      if (_senhaController.text.trim() == '') {
        _labelErro = 'Favor preencher o campo senha.';
        return;
      }

      final perfil = PerfilModel(
          nome: _nomeController.text,
          email: _emailController.text,
          senha: _senhaController.text,
          biometria: false,
          criadoEm: DateTime.now().toIso8601String());

      putPerfil(perfil);

      Routefly.replace('home');

    });
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
      final perfis = perfilState.value;
      return Scaffold(
          appBar: HDAppBar.defaultAppBar(context, 'REGISTRO', false, true),
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
              child: Center(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.center ,
                        children: [
                      HDText.defaultInputText(
                          'Nome',
                          false,
                          const EdgeInsets.fromLTRB(30, 5, 30, 10),
                          _nomeController,
                          TextCapitalization.sentences),
                      HDText.defaultInputText(
                          'E-mail',
                          false,
                          const EdgeInsets.fromLTRB(30, 5, 30, 10),
                          _emailController),
                      HDText.defaultInputText(
                          'Senha (5 dígitos ou mais)',
                          true,
                          const EdgeInsets.fromLTRB(30, 5, 30, 10),
                          _senhaController),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: SwitchListTileControl(),
                      ),
                      //SizedBox.fromSize(size: const Size(10, 30)),
                      Text(
                        _labelErro,
                        style: TextStyle(
                            color: HDColor.labelError, fontSize: 14.0),
                      ),
                      SizedBox.fromSize(size: const Size(10, 10)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topRight,
                                  end: FractionalOffset.bottomLeft,
                                  colors: [
                                    HDColor.buttonBronzeLight,
                                    HDColor.buttonBronze,
                                    HDColor.buttonBronzeLight,
                                  ],
                                  stops: const [0.20, 0.50, 0.90],
                                  transform: const GradientRotation(1)),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.57),
                                    //shadow for button
                                    blurRadius: 5) //blur radius of shadow
                              ]),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(300, 60),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: _registrar,
                            child: Text(
                              'REGISTRAR',
                              style: TextStyle(
                                  fontSize: 12, color: HDColor.buttonText),
                            ),
                          ),
                        ),
                      )
                    ])),
              )));
    });
  }
}

class SwitchListTileControl extends StatefulWidget {
  const SwitchListTileControl({super.key});

  @override
  State<SwitchListTileControl> createState() => _SwitchListTileState();
}

class _SwitchListTileState extends State<SwitchListTileControl> {
  @override
  Widget build(BuildContext context) {
    bool _biometry = false;

    return SwitchListTile(
      title: Text(
        "Biometria",
        style: TextStyle(
            color: HDColor.buttonBronze,
            fontSize: 15.0,
            fontWeight: FontWeight.bold),
      ),
      tileColor: HDColor.buttonBronze,
      value: _biometry,
      onChanged: (bool value) {
        setState(() {
          _biometry = value;
        });
      },
      secondary: Icon(
        Icons.fingerprint,
        color: HDColor.buttonBronze,
      ),
    );
  }
}
