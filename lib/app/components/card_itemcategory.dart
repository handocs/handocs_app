import 'package:flutter/material.dart';
import 'package:handocs_app/app/components/tag.dart';
import 'package:handocs_app/app/helpers/constants.dart';
import 'package:routefly/routefly.dart';

class HDCardItemCategory {
  static Widget defaultCardItemCategory(
      String text, IconData icon, int numShare, int numDocs) {
    return GestureDetector(
        onTap: () {
          Routefly.push('category');
        },
        child: Card(
          child: Container(
            padding: EdgeInsets.all(10.0),
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
                          'Fatura N123 - Junho de 2022',
                          style: TextStyle(
                              fontSize: 16,
                              //fontWeight: FontWeight.bold,
                              color: HDColor.bronzeLight),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star,
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
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.fromLTRB(2.0, 2.0, 10.0, 2.0),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(8.0), //or 15.0
                              child: Container(
                                height: 100.0,
                                width: 80.0,
                                color: HDColor.bronze,
                                child: Image.asset('assets/images/logo.png'),
                              ),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Validade: 01/03/2024',
                              style: TextStyle(
                                  fontSize: 12, color: HDColor.bronzeLight),
                            ),
                            Text(
                              'Tags:  55',
                              style: TextStyle(
                                  fontSize: 12, color: HDColor.bronzeLight),
                            ),
                            Wrap(
                              //textDirection: TextDirection.ltr,
                              //runSpacing: 0.0,
                              spacing: 1.0,
                              children: [
                                //HDTag.defaultTag('label'),
                              ],
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
}
