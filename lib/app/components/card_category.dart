import 'package:flutter/material.dart';
import 'package:handocs_app/app/helpers/constants.dart';
import 'package:routefly/routefly.dart';

class HDCardCategory {
  static Widget defaultCardCategory(
      String text, IconData icon, int numShare, int numDocs) {
    return GestureDetector(
        onTap: () {
          Routefly.push('category');
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
                    Icon(
                      icon,
                      color: HDColor.bronzeLight,
                      size: 40.0,
                    ),
                    Text(
                      text,
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
                              ' $numShare',
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
                              ' $numDocs',
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
}
