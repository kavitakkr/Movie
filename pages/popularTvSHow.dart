import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_clone/pages/detailsOfPage.dart';
import 'package:movies_clone/services/apiService.dart';

class PopularTvSHow extends StatefulWidget {
  const PopularTvSHow({super.key});

  @override
  State<PopularTvSHow> createState() => _PopularTvSHowState();
}

class _PopularTvSHowState extends State<PopularTvSHow> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api().fetch(),
        builder: (contex, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final result1 = snapshot.data;

            return Container(
              child: SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: result1!.length,
                  itemBuilder: (context, index, realIndex) {
                    return SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsOfPage(
                                  description: result1[index]["description"],
                                  image: result1[index]["image"],
                                  rating: result1[index]["rating"].toString(),
                                  year: result1[index]["year"].toString(),
                                  title: result1[index]["title"]),
                            )),
                        child: Container(
                          width: 150,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(result1[index][
                                          "image"])), // Image.network(result1[index]["image"])),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 245,
                              ),
                            ),
                            Container(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  result1[index]["title"],
                                  style: const TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    viewportFraction: 0.55,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
