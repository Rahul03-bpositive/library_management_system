import 'package:app/methods/common.dart';
import 'package:app/pages/homepge.dart';
import 'package:flutter/material.dart';

class Interest extends StatefulWidget {
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  final List<Map<String, dynamic>> items = [
    {'image': 'assets/images/cricket.png', 'label': 'Cricket'},
    {'image': 'assets/images/bitcoin.png', 'label': 'crypto'},
    {'image': 'assets/images/youtube.png', 'label': 'youtube'},
    {'image': 'assets/images/football.png', 'label': 'football'},
    {'image': 'assets/images/motorsports.png', 'label': 'MotorSports'},
    // {'image': 'assets/images/google.png', 'label': 'Stocks'},
    {'image': 'assets/images/news.png', 'label': 'News'},
    {'image': 'assets/images/crypto.png', 'label': 'Economy'},
    {'image': 'assets/images/basketball.png', 'label': 'Basketball'},
    {'image': 'assets/images/gaming.png', 'label': 'Gaming'},
    {'image': 'assets/images/tennis.png', 'label': 'Tennis'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color('fff3f3f3'),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "What are you interested in?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Select 3 or more interest',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 500,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1,
                      mainAxisExtent: 120,
                    ),

                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          //
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  items[index]['image'],
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  items[index]['label'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 90),
                SizedBox(
                  width: double.infinity, // Full-width button
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,

                      // Change color as needed
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Ensure text is visible
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
