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
  CategoriaModel _categoriaModel = CategoriaModel.copyInit();

  bool _editState = false;
  bool _createState = false;

  @override
  void initState() {
    super.initState();

    final _arguments = Routefly.query.arguments;

    if (_arguments != null) {
      _categoriaModel = _arguments as CategoriaModel;
    }

    if (_arguments == null) {
      _createState = true;
      _editState = false;
    } else {
      _createState = false;
      _editState = true;
    }
  }

  final TextEditingController _nomeController = TextEditingController();
  String _labelErro = '';

  void _regSALVAR() {
    _alterar();
  }

  void _regCARTAO() {
    _registrar('CARTAO', Icons.credit_card_outlined);
  }

  void _regCONTATO() {
    _registrar('CONTATO', Icons.person_pin_outlined);
  }

  void _regLINK() {
    _registrar('LINK', Icons.link_outlined);
  }

  void _regDOCUMENTO() {
    _registrar('DOCUMENTO', Icons.document_scanner_outlined);
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
          tipo: tipo,
          icone: icon.codePoint,
          qtdeItens: 0,
          qtdeCompartilhados: 0,
          criadoEm: DateTime.now().toIso8601String());

      putCategoria(categoria);

      Routefly.pop(context);
    });
  }

  void _alterar() {
    setState(() {
      _labelErro = '';

      if (_nomeController.text.trim() == '') {
        _labelErro = 'Favor preencher o campo Nome da Categoria.';
        return;
      }

      putCategoria(_categoriaModel.copyWith(nome: _nomeController.text.trim()))
          .then((value) {
        Routefly.pop(context);
      });
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
                _buttonEdit('SALVAR', _regSALVAR),
                _buttonCreate(
                    'CARTÕES', _regCARTAO, Icons.credit_card_outlined),
                _buttonCreate(
                    'CONTATOS', _regCONTATO, Icons.person_pin_outlined),
                _buttonCreate('LINKS', _regLINK, Icons.link_outlined),
                _buttonCreate('DOCUMENTOS', _regDOCUMENTO,
                    Icons.document_scanner_outlined),
                _buttonCreate(
                    'RECEITAS', _regRECEITA, Icons.local_pharmacy_outlined),
              ]))),
    );
  }

  Widget _buttonCreate(String textButton, Function() function, IconData icon) {
    if (_createState) {
      return HDButton.defaultButton(textButton, function, icon);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buttonEdit(String textButton, Function() function) {
    if (_editState) {
      return HDButton.defaultButton(textButton, function);
    } else {
      return const SizedBox.shrink();
    }
  }
}
