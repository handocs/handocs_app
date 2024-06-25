import 'package:flutter/material.dart';
import 'package:handocs_app/app/helpers/constants.dart';
import 'package:handocs_app/app/helpers/formats.dart';
import 'package:handocs_app/app/interactor/models/categoria_item_model.dart';
import 'package:routefly/routefly.dart';
import 'package:url_launcher/url_launcher.dart';

class HDCardItemCategory {
  static Widget defaultCardItemCategory(CategoriaItemModel itemModel) {
    return GestureDetector(
        onTap: () {
          return;
          Routefly.push('category');
        },
        child: cardItem(itemModel));
  }

  static Widget cardItem(CategoriaItemModel itemModel) {
    String tipo = itemModel.tipo.trim().toUpperCase();

    if (tipo == 'CARTAO') {
      return cardItemCartao(itemModel);
    } else if (tipo == 'CONTATO') {
      return cardItemContato(itemModel);
    } else if (tipo == 'LINK') {
      return cardItemLink(itemModel);
    } else if (tipo == 'RECEITA') {
      return cardItemReceita(itemModel);
    } else if (tipo == 'DOCUMENTO') {
      return cardItemDocumento(itemModel);
    } else {
      return cardItemDocumento(itemModel);
    }
  }

  static Widget cardItemCartao(CategoriaItemModel itemModel) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemModel.nome,
                      style: TextStyle(
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                          color: HDColor.bronzeLight),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_border_outlined,
                          color: HDColor.buttonBronze,
                        ))
                  ],
                ),
                Divider(
                  color: HDColor.bronzeLight,
                  thickness: 0.1,
                ),
                const SizedBox(width: 1, height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(2.0, 2.0, 10.0, 2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0), //or 15.0
                          child: Container(
                            height: 100.0,
                            width: 80.0,
                            color: HDColor.bronze,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemModel.ref01,
                          style: TextStyle(
                              fontSize: 22, color: HDColor.bronzeLight),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Validade',
                                  style: TextStyle(
                                      fontSize: 12, color: HDColor.bronze),
                                ),
                                Text(
                                  itemModel.ref03,
                                  style: TextStyle(
                                      fontSize: 16, color: HDColor.bronzeLight),
                                ),
                              ],
                            ),
                            const Column(
                              children: [
                                SizedBox(width: 50),
                                SizedBox(width: 50)
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Código',
                                  style: TextStyle(
                                      fontSize: 12, color: HDColor.bronze),
                                ),
                                Text(
                                  '*****',
                                  style: TextStyle(
                                      fontSize: 16, color: HDColor.bronzeLight),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          itemModel.ref02,
                          style: TextStyle(
                              fontSize: 16, color: HDColor.bronzeLight),
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
    );
  }

  static Widget cardItemContato(CategoriaItemModel itemModel) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(
                        Icons.contacts_sharp,
                        size: 20,
                        color: HDColor.bronzeLight,
                      ),
                      const SizedBox(width: 15.0),
                      Text(
                        itemModel.nome,
                        style: TextStyle(
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            color: HDColor.bronzeLight),
                      )
                    ]),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_border_outlined,
                          color: HDColor.buttonBronze,
                        ))
                  ],
                ),
                Divider(
                  color: HDColor.bronzeLight,
                  thickness: 0.1,
                ),
                const SizedBox(width: 1, height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(2.0, 2.0, 10.0, 2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0), //or 15.0
                          child: Container(
                            height: 100.0,
                            width: 80.0,
                            color: HDColor.bronze,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.contact_mail,
                              size: 20,
                              color: HDColor.bronzeLight,
                            ),
                            const SizedBox(width: 15.0),
                            Text(
                              itemModel.ref01,
                              style: TextStyle(
                                  fontSize: 16, color: HDColor.bronzeLight),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.contact_phone,
                              size: 20,
                              color: HDColor.bronzeLight,
                            ),
                            const SizedBox(width: 15.0),
                            Text(
                              itemModel.ref02,
                              style: TextStyle(
                                  fontSize: 16, color: HDColor.bronzeLight),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.factory,
                              size: 20,
                              color: HDColor.bronzeLight,
                            ),
                            const SizedBox(width: 15.0),
                            Text(
                              itemModel.ref03,
                              style: TextStyle(
                                  fontSize: 16, color: HDColor.bronzeLight),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.note,
                              size: 20,
                              color: HDColor.bronzeLight,
                            ),
                            const SizedBox(width: 15.0),
                            Text(
                              itemModel.ref04,
                              style: TextStyle(
                                  fontSize: 16, color: HDColor.bronzeLight),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget cardItemLink(CategoriaItemModel itemModel) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(
                        Icons.hexagon_outlined,
                        size: 20,
                        color: HDColor.bronzeLight,
                      ),
                      const SizedBox(width: 15.0),
                      Text(
                        itemModel.nome,
                        style: TextStyle(
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            color: HDColor.bronzeLight),
                      )
                    ]),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_border_outlined,
                          color: HDColor.buttonBronze,
                        ))
                  ],
                ),
                Divider(
                  color: HDColor.bronzeLight,
                  thickness: 0.1,
                ),
                const SizedBox(width: 1, height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.link_outlined,
                      size: 40,
                      color: HDColor.bronzeLight,
                    ),
                    const SizedBox(width: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        _launchURL(itemModel.ref01);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: HDColor.bodyBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: HDColor.bronzeLight),
                          )),
                      child: Text(
                        itemModel.ref01,
                        style:
                            TextStyle(fontSize: 16, color: HDColor.bronzeLight),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget cardItemReceita(CategoriaItemModel itemModel) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(
                        Icons.person,
                        size: 20,
                        color: HDColor.bronzeLight,
                      ),
                      const SizedBox(width: 15.0),
                      Text(
                        itemModel.nome,
                        style: TextStyle(
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            color: HDColor.bronzeLight),
                      )
                    ]),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_border_outlined,
                          color: HDColor.buttonBronze,
                        ))
                  ],
                ),
                Divider(
                  color: HDColor.bronzeLight,
                  thickness: 0.1,
                ),
                const SizedBox(width: 1, height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(2.0, 2.0, 10.0, 2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0), //or 15.0
                          child: Container(
                            height: 100.0,
                            width: 80.0,
                            color: HDColor.bronze,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.medical_services_rounded,
                              size: 20,
                              color: HDColor.bronzeLight,
                            ),
                            const SizedBox(width: 15.0),
                            Text(
                              itemModel.ref01,
                              style: TextStyle(
                                  fontSize: 16, color: HDColor.bronzeLight),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.medical_information_rounded,
                              size: 20,
                              color: HDColor.bronzeLight,
                            ),
                            const SizedBox(width: 15.0),
                            Text(
                              "CRM: ${itemModel.ref02}",
                              style: TextStyle(
                                  fontSize: 16, color: HDColor.bronzeLight),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.timer_rounded,
                              size: 20,
                              color: HDColor.bronzeLight,
                            ),
                            const SizedBox(width: 15.0),
                            Text(
                              HDFormart.dateToDDMMYYYY(itemModel.validade),
                              style: TextStyle(
                                  fontSize: 16, color: HDColor.bronzeLight),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget cardItemDocumento(CategoriaItemModel itemModel) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Icon(
                        Icons.document_scanner,
                        size: 20,
                        color: HDColor.bronzeLight,
                      ),
                      const SizedBox(width: 15.0),
                      Text(
                        itemModel.nome,
                        style: TextStyle(
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            color: HDColor.bronzeLight),
                      )
                    ]),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_border_outlined,
                          color: HDColor.buttonBronze,
                        ))
                  ],
                ),
                Divider(
                  color: HDColor.bronzeLight,
                  thickness: 0.1,
                ),
                const SizedBox(width: 1, height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(2.0, 2.0, 10.0, 2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0), //or 15.0
                          child: Container(
                            height: 100.0,
                            width: 80.0,
                            color: HDColor.bronze,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.description,
                              size: 20,
                              color: HDColor.bronzeLight,
                            ),
                            const SizedBox(width: 15.0),
                            SizedBox(
                                width: 200,
                                child: Text(
                                  itemModel.descricao,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16, color: HDColor.bronzeLight),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.timer_rounded,
                              size: 20,
                              color: HDColor.bronzeLight,
                            ),
                            const SizedBox(width: 15.0),
                            Text(
                              HDFormart.dateToDDMMYYYY(itemModel.validade),
                              style: TextStyle(
                                  fontSize: 16, color: HDColor.bronzeLight),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  static _launchURL(String url) async {
    final Uri urlParse = Uri.parse(url);
    if (!await launchUrl(urlParse)) {
      throw Exception('Could not launch $url');
    }
  }
}
