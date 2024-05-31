import 'package:flutter/material.dart';
import 'package:handocs_app/app/helpers/constants.dart';
import 'package:handocs_app/app/interactor/models/categoria_model.dart';

class HDCardCategory {
  //static Widget defaultCardCategory(int id, String text, IconData icon, int numShare,      int numDocs, bool edit, bool delete, Function() fOnTap) {
  static defaultCardCategory(CategoriaModel categoriaModel, bool edit,
      bool delete, Function(CategoriaModel model) fOnTap) {
    return GestureDetector(
        onTap: () {
          fOnTap(categoriaModel);
        },
        child: Card(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: const Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide.none,
                    bottom: BorderSide.none),
                color: HDColor.cardBackground),
            //margin: EdgeInsets.all(5),
            //padding: EdgeInsets.all(5),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buttomAction(edit, delete),
                    Icon(
                      IconData(categoriaModel.icone,
                          fontFamily: 'MaterialIcons'),
                      color: HDColor.bronzeLight,
                      size: 40.0,
                    ),
                    Text(
                      categoriaModel.nome,
                      style: TextStyle(
                          fontSize: 14,
                          //fontWeight: FontWeight.bold,
                          color: HDColor.bronzeLight),
                    ),
                    const SizedBox(width: 1, height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 14,
                              color: HDColor.bronzeLight,
                            ),
                            Text(
                              ' ${categoriaModel.qtdeCompartilhados}',
                              style: TextStyle(
                                  color: HDColor.bronzeLight, fontSize: 14),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.plagiarism_rounded,
                              size: 14,
                              color: HDColor.bronzeLight,
                            ),
                            Text(
                              ' ${categoriaModel.qtdeItens}',
                              style: TextStyle(
                                  color: HDColor.bronzeLight, fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  static Widget _buttomAction(bool edit, bool delete) {
    IconData iconAction = Icons.circle_rounded;
    debugPrint('Edit:$edit | Delete: $delete');
    if (edit) {
      iconAction = Icons.edit_note;
    }
    if (delete) {
      iconAction = Icons.close;
    }

    if (edit || delete) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: HDColor.bronzeLight,
              ),
              child: Icon(
                iconAction,
                color: HDColor.bodyBackground,
                size: 20.0,
              )),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}
