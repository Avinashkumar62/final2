import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:final2/cards.dart';

void main() {
  runApp(const MaterialApp(
    home: OnboardingSecondScreen(),
  ));
}

class OnboardingSecondScreen extends StatefulWidget {
  const OnboardingSecondScreen({super.key});

  @override
  State<OnboardingSecondScreen> createState() => _OnboardingSecondScreenState();
}

class _OnboardingSecondScreenState extends State<OnboardingSecondScreen> {
  final List<int> _selectedItems = [];
  List<String> _data = [];

  @override
  void initState() {
    super.initState();
    loadDataFromJson();
    loadSelectedItemsFromSharedPreferences(); // Load selected items
  }

  Future<void> loadDataFromJson() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final List<String> jsonTextData =
        List<String>.from(jsonData['data'].map((item) => item['text']));
    setState(() {
      _data = jsonTextData;
    });
  }

  void _toggleItem(int itemId) {
    if (_selectedItems.contains(itemId)) {
      _selectedItems.remove(itemId);
    } else {
      _selectedItems.add(itemId);
    }
    setState(() {});
  }

  void _handleLogSelectedItems() {
    final selectedItemsText =
        _selectedItems.map((itemId) => _data[itemId]).toList();
    print('Selected Items: $selectedItemsText');
    saveSelectedItemsToSharedPreferences(); // Save selected items
    loadSelectedItemsFromSharedPreferences();
  }

  // Function to save selected items using SharedPreferences
  Future<void> saveSelectedItemsToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        'selected_items', _selectedItems.map((index) => _data[index]).toList());
    print('Selected items saved to SharedPreferences.');
  }

  // Function to load selected items from SharedPreferences
  Future<void> loadSelectedItemsFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? selectedItems = prefs.getStringList('selected_items');

    final jsond = json.encode(selectedItems);
    Directory? documentDir = await getExternalStorageDirectory();
    if (documentDir == null) {
      print("external storage not availbale");
      return;
    }
    String path = '${documentDir.path}assets/output.txt';
    print(path);
    File(path).createSync(recursive: true);
    File file = File(path);
    file.writeAsStringSync(jsond);
    print("jsonData" + jsond);
    if (selectedItems != null) {
      // Convert selected items back to indices
      _selectedItems.clear();
      for (String selectedItem in selectedItems) {
        int index = _data.indexOf(selectedItem);
        if (index != -1) {
          _selectedItems.add(index);
        }
      }
      setState(() {});
      print('Selected items loaded from SharedPreferences.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 32, top: 40),
              child: Text(
                "Choose the content that you are interested. ",
                style: TextStyle(
                  fontFamily: "HCLTechRoobert",
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff4b9ef9),
                  // height: 142/36,
                ),
                textAlign: TextAlign.left,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 13, // Adjust the spacing between items as needed
                  runSpacing: 13, // Adjust the spacing between rows as needed
                  children: List.generate(_data.length, (index) {
                    final item = _data[index];
                    final isSelected = _selectedItems.contains(index);
                    final textLength = item.length;
                    final buttonWidth = textLength * 16.0; // Adjust as needed

                    return OutlinedButton(
                      onPressed: () => _toggleItem(index),
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            isSelected ? Colors.black : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      child: Container(
                        width: buttonWidth, // Set the width
                        height: 62, // Set the height
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 18),
                        //     decoration: BoxDecoration( border: Border.all(color: Colors.black), // Set the border color to black
                        // borderRadius: BorderRadius.circular(18),),
                        child: Text(
                          item,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.only(bottom: 22, right: 20),
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CardScreen()));
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFF5F1EBE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: const BorderSide(color: Colors.transparent),
              ),
              child: Container(
                width: 147, // Set the width
                height: 57,
                alignment: Alignment.center, // Set the height
                // padding:
                //     const EdgeInsets.symmetric(horizontal: 10, vertical: 16),

                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'HCLTechRoobert',
                        fontWeight: FontWeight.w400,
                        height: 0.6,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 6),
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    )
                    // Add the arrow icon
                  ],
                ),
                // Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
