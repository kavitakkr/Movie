import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_clone/pages/detailsOfPage.dart';
import 'package:movies_clone/services/apiService.dart';

import 'popularTvSHow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<MovieModel> movieMOdel = [];
  bool processing = true;
  List gettingImage = [];
  Map<String, dynamic> gettingValues = {};

  @override
  void initState() {
    super.initState();
    //calling Api
    // fetch();
  }

  @override
  void setState(VoidCallback fn) {
    processing = false;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          "assets/flutflix.png",
          height: 40,
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: Api().fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final result1 = snapshot.data;
              // gettingValues.add(result1);
              print(result1);
              print(gettingValues);

              // final image = result1!["image"];
              // print(image);
              // final title = result1!["title"];

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Popular TV Shows Movies",
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: const PopularTvSHow(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Trending Movies",
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: result1!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: 150,
                                child: Column(children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return DetailsOfPage(
                                            description: result1[index]
                                                ["description"],
                                            image: result1[index]["image"],
                                            rating: result1[index]["rating"]
                                                .toString(),
                                            year: result1[index]["year"]
                                                .toString(),
                                            title: result1[index]["title"],
                                          );
                                        },
                                      ));
                                    },
                                    child: Container(
                                      child: Image.network(
                                          result1[index]["image"]),
                                      height: 200,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      // height: 20,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          result1[index]["title"],
                                          style: const TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Top Rated Movies",
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          //getting value from internet
                          itemCount: result1!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return DetailsOfPage(
                                        description: result1[index]
                                            ["description"],
                                        image: result1[index]["image"],
                                        rating:
                                            result1[index]["rating"].toString(),
                                        year: result1[index]["year"].toString(),
                                        title: result1[index]["title"],
                                      );
                                    },
                                  ));
                                },
                                child: Container(
                                  width: 150,
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        height: 200,
                                        child: Image.network(
                                            result1[index]["image"]),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          result1[index]["title"],
                                          style: const TextStyle(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
