import 'dart:io';

import 'package:asp/asp.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:handocs_app/app/components/button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../components/appbar.dart';
import '../components/text.dart';
import '../helpers/constants.dart';

class CategoryItemEditPage extends StatefulWidget {
  const CategoryItemEditPage({super.key});

  @override
  State<CategoryItemEditPage> createState() => _CategoryItemEditPageState();
}

class _CategoryItemEditPageState extends State<CategoryItemEditPage> {
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _cartaoController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _validadeController = TextEditingController();
  final TextEditingController _codigoController = TextEditingController();
  String _labelErro = '';

  final ImagePicker _picker = ImagePicker();
  final double padding = 20.0;

  XFile? pickedFile = XFile('assets/images/logo.png');

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (_) {
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
                          'Descrição',
                          false,
                          const EdgeInsets.fromLTRB(30, 5, 30, 10),
                          _descricaoController,
                          TextCapitalization.sentences),
                      Text(
                        "Adicionar documento.",
                        style: TextStyle(color: HDColor.bronze),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            HDButton.defaultButtonShort(
                                "GALERIA", _galeria, Icons.image),
                            HDButton.defaultButtonShort(
                                "CAMERA", _camera, Icons.camera_alt),
                            HDButton.defaultButtonShort(
                                "PDF", () => null, Icons.picture_as_pdf),
                          ],
                        ),
                      ),
                      DottedBorder(
                          borderType: BorderType.RRect,
                          color: HDColor.buttonBronzeLight,
                          radius: const Radius.circular(10),
                          strokeWidth: 4,
                          child: Container(
                            width: 300.0,
                            height: 100.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                        color: HDColor.bronzeLight
                                            .withOpacity(0.3),
                                        width: 80.0,
                                        height: 100,
                                        //child: Image.asset('assets/images/logo.png')
                                        child: Image.file(
                                            File(pickedFile!.path)))),
                                Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                        color: HDColor.bronzeLight
                                            .withOpacity(0.3),
                                        width: 80.0,
                                        height: 100,
                                        child: Image.asset(
                                            'assets/images/logo.png'))),
                                Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                        color: HDColor.bronzeLight
                                            .withOpacity(0.3),
                                        width: 80.0,
                                        height: 100,
                                        child: Image.asset(
                                            'assets/images/logo.png'))),
                              ],
                            ),
                          )),
                      HDText.defaultInputMaskText(
                          'Nº Cartão',
                          false,
                          const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          _cartaoController,
                          MaskTextInputFormatter(mask: "####-####-####-####"),
                          null,
                          "9999-9999-9999-9999",
                          TextInputType.number),
                      HDText.defaultInputText(
                          'Nome do Cartão',
                          false,
                          const EdgeInsets.fromLTRB(30, 5, 30, 10),
                          _nomeController),
                      HDText.defaultInputMaskText(
                          'Validade',
                          false,
                          const EdgeInsets.fromLTRB(30, 5, 30, 10),
                          _validadeController,
                          MaskTextInputFormatter(mask: "##/##"),
                          null,
                          "99/99",
                          TextInputType.number),
                      HDText.defaultInputMaskText(
                          'Código Segurança',
                          true,
                          const EdgeInsets.fromLTRB(30, 5, 30, 10),
                          _codigoController,
                          MaskTextInputFormatter(mask: "###"),
                          null,
                          "000",
                          TextInputType.number),
                      Text(
                        _labelErro,
                        style: TextStyle(
                            color: HDColor.labelError, fontSize: 14.0),
                      ),
                      HDButton.defaultButton("REGISTRAR", () => null)
                    ])),
              )));
    });
  }

  /// Pick an image
  void _galeria() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _labelErro = image.path;
        pickedFile = image;
      });
    }
  }

  /// Capture a photo
  void _camera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _labelErro = photo.path;
        pickedFile = photo;
      });
    }
  }

  /// Pick a video
  void pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        pickedFile = video;
      });
    }
  }

  /// Capture a video
  void captureVideo() async {
    final XFile? capturedVideo =
        await _picker.pickVideo(source: ImageSource.camera);
    if (capturedVideo != null) {
      setState(() {
        pickedFile = capturedVideo;
      });
    }
  }

  /// Pick multiple images
  void pickMultipleImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    //TODO: do something with images
  }
}
