import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsOfPage extends StatelessWidget {
  final String image, rating, year, description, title;
  DetailsOfPage(
      {super.key,
      required this.description,
      required this.image,
      required this.rating,
      required this.year,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  //Poster bigger
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220),
                  child: Text(
                    "⭐️ Average Rating-" + rating,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 25, left: 10),
              child: Text(
                "Releasing On-" + year,
                style: const TextStyle(
                    fontSize: 13,
                    decoration: TextDecoration.none,
                    color: Colors.white),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                  height: 140,
                  width: 100,
                ),
                Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      description,
                      style: const TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
