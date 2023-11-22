import 'dart:convert';
import 'package:final2/card_data.dart';
import 'package:final2/time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const CardScreen());
}

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  List<CardData> cardDataList = [];

  @override
  void initState() {
    super.initState();
    loadCardData();
  }

  Future<void> loadCardData() async {
    final String jsonData = await rootBundle.loadString('assets/card.json');
    final List<dynamic> jsonList = json.decode(jsonData);

    List<CardData> data = [];

    for (var item in jsonList) {
      data.add(
        CardData(
          image: item['image'],
          timestamp: item['timestamp'],
          title: item['title'],
          otherField: item['otherField'],
        ),
      );
    }

    setState(() {
      cardDataList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: ListView.builder(
                itemCount: cardDataList.length,
                itemBuilder: (context, index) {
                  return LayoutBuilder(builder: (context, constraints) {
                    final cardWidth = constraints.maxWidth;
                    final cardHeight = cardWidth * 0.8;
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(children: [
                        Container(
                          width: cardWidth,
                          height: cardHeight,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(cardDataList[index].image),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Container(
                          width: cardWidth,
                          height: cardHeight,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: const Alignment(0.00, -1.00),
                              end: const Alignment(0, 1),
                              colors: [
                                Colors.black.withOpacity(0),
                                Colors.black
                              ],
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Container(
                          width: cardWidth,
                          height: cardHeight,
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15,
                            bottom: 27,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 148,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: SizedBox(
                                        width: cardDataList[index]
                                                .title
                                                .length
                                                .toDouble() *
                                            12,
                                        height: 32,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: cardDataList[index]
                                                        .title
                                                        .length
                                                        .toDouble() *
                                                    12,
                                                height: 32,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 18,
                                              top: 20,
                                              child: Text(
                                                cardDataList[index].title,
                                                style: const TextStyle(
                                                  color: Color(0xFF5F1EBE),
                                                  fontSize: 16,
                                                  fontFamily: 'HCLTech Roobert',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.001,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 0,
                                      top: 47,
                                      child: SizedBox(width: 56, height: 101),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                width: double.infinity,
                                height: 58,
                                child: Text(
                                  cardDataList[index].otherField,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontFamily: 'HCLTech Roobert',
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 11),
                              Container(
                                width: double.infinity,
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
                              const SizedBox(height: 15),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          padding: const EdgeInsets.all(3),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 18,
                                                height: 18,
                                                clipBehavior: Clip.antiAlias,
                                                decoration:
                                                    const BoxDecoration(),
                                                child: const Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 18,
                                                      height: 18,
                                                      child: Stack(children: [
                                                        Icon(Icons.access_time,
                                                            size: 19,
                                                            color:
                                                                Colors.white),
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
                                          formatUploadedTime(
                                              cardDataList[index].timestamp),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 30),
                                    Expanded(child: Container(height: 2)),
                                    const SizedBox(width: 30),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: const Stack(children: [
                                        Icon(Icons.share_outlined,
                                            size: 17, color: Colors.white),
                                      ]),
                                    ),
                                    const SizedBox(width: 30),
                                    Container(
                                      width: 24,
                                      height: 24,
                                      padding: const EdgeInsets.only(
                                        top: 3,
                                        left: 4,
                                        right: 3.64,
                                        bottom: 3,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 16.36,
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
                                                Icon(
                                                    Icons
                                                        .bookmark_border_outlined,
                                                    size: 18,
                                                    color: Colors.white),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    );
                  });
                })));
  }
}
