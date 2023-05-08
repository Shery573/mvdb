import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
Widget AppointmentCards(
    BuildContext context, String name, String imageURL, int index) {
  return Padding(
    padding: const EdgeInsets.only(top: 12, right: 12.0),
    child: Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index % 2 == 0 ? green : blue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: CircleAvatar(
              radius: 45,
              foregroundImage: NetworkImage(imageURL),
            ),
          ),
          Text(
            name,
            style: GoogleFonts.lexendDeca(
              color: index % 2 == 0 ? blue : green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: index % 2 == 0 ? blue : green,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.all(Radius.circular(20)),
                splashColor: Colors.grey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    'Book an appointment',
                    style: GoogleFonts.lexendDeca(
                        textStyle: TextStyle(
                          fontSize: 13,
                          color: index % 2 == 0 ? green : blue,
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
