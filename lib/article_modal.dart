import 'dart:convert';
import 'package:final2/article_data.dart';
import 'package:final2/card_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyScreen extends StatefulWidget {
  const MyScreen(CardData cardData, {super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  List<ArticleModal> articleModalList = [];
  @override
  void initState() {
    super.initState();
    loadCardData();
  }

  Future<void> loadCardData() async {
    final String jsonData = await rootBundle.loadString('assets/article.json');
    final List<dynamic> jsonList = json.decode(jsonData);

    List<ArticleModal> data = [];
    for (var item in jsonList) {
      data.add(
        ArticleModal(
          image: item['image'],
          timestamp: item['timestamp'],
          title: item['title'],
          otherField: item['otherField'],
          description: item['description'],
        ),
      );
    }
    setState(() {
      articleModalList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView.builder(
                itemCount: articleModalList.length,
                itemBuilder: (context, index) {
                  return Container(
                      width: 460,
                      height: 7978,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Stack(children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(articleModalList[index]
                                    .image), // Replace with your image path
                                fit: BoxFit
                                    .cover, // You can adjust the fit as needed
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Container(
                            width: 460,
                            height: 424,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: const Alignment(-0.00, 1.00),
                                end: const Alignment(0, -1),
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(0)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 602,
                          child: SizedBox(
                            width: 330,
                            height: 146,
                            child: Text(
                              (articleModalList[index].otherField),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontFamily: 'HCLTech Roobert',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 158,
                          top: 740,
                          child: Container(
                            width: 45,
                            height: 46,
                            decoration: const BoxDecoration(),
                            child: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 853,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFF14142B)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  (articleModalList[index].title),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xFF14142B),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 86,
                          top: 853,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFF14142B)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  (articleModalList[index].title),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xFF14142B),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 117,
                          top: 853,
                          child: SizedBox(width: 180, height: 4),
                        ),
                        Positioned(
                          left: 279,
                          top: 853,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 18,
                                      height: 18,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 17.98,
                                            height: 17.98,
                                            child: Stack(children: [
                                              Icon(Icons.access_time,
                                                  size: 20, color: Colors.blue),
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                (articleModalList[index].timestamp),
                                style: const TextStyle(
                                  color: Color(0xFF4B9EF9),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 900,
                          child: Container(
                            width: 350,
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFD9DBE8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 920,
                          child: SizedBox(
                            width: 350,
                            child: Text(
                              (articleModalList[index].description),
                              style: const TextStyle(
                                color: Color(0xFF14142B),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 1300,
                          child: Container(
                            width: 350,
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFD9DBE8),
                                ),
                              ),
                            ),
                          ),
                        ),
        
                      ]));
                }),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 68,
                padding: const EdgeInsets.only(
                  top: 22,
                  left: 15,
                  right: 15,
                  bottom: 15,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: ShapeDecoration(
                                color: Colors.white.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 2.50,
                            top: 2.75,
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 5,
                                    top: 5,
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_back,
                                          color: Colors.black),
                                      iconSize: 20,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: Container(height: 3)),
                    const SizedBox(width: 10),
                    Container(
                      width: 80,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: const Stack(children: [
                              Icon(
                                Icons.headset,
                                color: Colors.black,
                                size: 20,
                              )
                            ]),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'Listen',
                            style: TextStyle(
                              color: Color(0xFF14142B),
                              fontSize: 16,
                              fontFamily: 'HCLTech Roobert',
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: ShapeDecoration(
                                color: Colors.white.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 5,
                            child: Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.only(
                                top: 2.50,
                                left: 3.33,
                                right: 3.03,
                                bottom: 2.50,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 13.64,
                                    height: 15,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.bookmark,
                                          color: Colors.black,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 30,
                      height: 40,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 30,
                              height: 40,
                              decoration: ShapeDecoration(
                                color: Colors.white.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 5,
                            child: Container(
                              width: 20,
                              height: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: const Stack(children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.black,
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
