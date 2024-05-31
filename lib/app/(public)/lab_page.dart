import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class LabPage extends StatefulWidget {
  const LabPage({super.key});

  @override
  State<LabPage> createState() => _LabPageState();
}

class _LabPageState extends State<LabPage> {
  @override
  Widget build(BuildContext context) {
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
                        'JOAO DA SILVA XAVIER',
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
                              'joao.xavier@teste.com',
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
                              '(11)9.9999-8888',
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
                              'HANDOCS LTDA',
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
                              'Informações gerais...',
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
}
