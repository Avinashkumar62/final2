import 'package:final2/Onboarding_2.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    // Onboarding Page 1
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            'images/Rectangle 1526.png',
                            height: MediaQuery.of(context).size.height / 2,
                            fit: BoxFit.fill,
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 200, top: 12),
                            child: Text(
                              'Supercharging Progress',
                              style: TextStyle(
                                color: Color(0xFFA0A3BD),
                                fontSize: 16,
                                fontFamily: 'HCLLightFont',
                                fontWeight: FontWeight.w400,
                                height: 0.10,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 60),
                            child: Text(
                              'Progress. It comes from moving forward unwaveringly toward success.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontFamily: 'HCLFont',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Onboarding Page 2
                    Container(
                      color: Colors.green,
                      child: Center(
                        child: Text("Onboarding Page 2"),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildDot(0),
                  _buildDot(1),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OnboardingSecondScreen()));
          },
          backgroundColor: Color(0xFFE2E9F9),
          foregroundColor: Colors.black,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }

  Widget _buildDot(int pageIndex) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == pageIndex ? Colors.blue : Colors.grey,
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
