import 'package:flutter/material.dart';
import 'package:handocs_app/app/(public)/register_page.dart';
import 'package:handocs_app/app/components/button.dart';
import 'package:handocs_app/app/components/card_itemcategory.dart';
import 'package:handocs_app/app/components/dropdown.dart';
import 'package:handocs_app/app/helpers/constants.dart';
import 'package:handocs_app/app/interactor/actions/categoria_action.dart';
import 'package:handocs_app/app/interactor/models/categoria_model.dart';
import 'package:routefly/routefly.dart';
import '../components/appbar.dart';
import '../components/text.dart';

class CategoryEditPage extends StatefulWidget {
  const CategoryEditPage({super.key});

  @override
  State<CategoryEditPage> createState() => _CategoryEditPageState();
}

class _CategoryEditPageState extends State<CategoryEditPage> {
  final TextEditingController _nomeController = TextEditingController();
  String _labelErro = '';

  void _regCARTAO() {
    _registrar('CARTAO', Icons.card_giftcard);
  }

  void _regCONTATO() {
    _registrar('CONTATO', Icons.person);
  }

  void _regLINK() {
    _registrar('LINK', Icons.link);
  }

  void _regDOCUMENTO() {
    _registrar('DOCUMENTO', Icons.document_scanner);
  }

  void _regRECEITA() {
    _registrar('RECEIRA', Icons.local_pharmacy_outlined);
  }

  void _registrar(String tipo, IconData icon) {
    setState(() {
      _labelErro = '';

      if (_nomeController.text.trim() == '') {
        _labelErro = 'Favor preencher o campo Nome da Categoria.';
        return;
      }

      final categoria = CategoriaModel(
          id: -1,
          nome: _nomeController.text,
          icone: icon.codePoint,
          qtdeItens: 0,
          qtdeCompartilhados: 0,
          criadoEm: DateTime.now().toIso8601String());

      putCategoria(categoria);

      Routefly.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HDAppBar.defaultAppBar(context, 'NOVA CATEGORIA', false, true),
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
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                HDText.defaultInputText(
                    'Nome da Categoria',
                    false,
                    const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    _nomeController,
                    TextCapitalization.sentences),
                Text(
                  _labelErro,
                  style: TextStyle(color: HDColor.labelError, fontSize: 14.0),
                ),
                SizedBox.fromSize(size: const Size(10, 10)),
                HDButton.defaultButton(
                    'CARTÕES', _regCARTAO, Icons.card_giftcard),
                HDButton.defaultButton('CONTATOS', _regCONTATO, Icons.person),
                HDButton.defaultButton('LINKS', _regLINK, Icons.link),
                HDButton.defaultButton(
                    'DOCUMENTOS', _regDOCUMENTO, Icons.document_scanner),
                    HDButton.defaultButton(
                        'RECEITAS', _regRECEITA, Icons.document_scanner),
              ]))),
    );
  }
}
