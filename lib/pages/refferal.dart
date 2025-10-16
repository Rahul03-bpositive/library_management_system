import 'package:app/methods/common.dart';
import 'package:app/pages/interest.dart';
import 'package:flutter/material.dart';

class Refferal extends StatefulWidget {
  const Refferal({super.key});

  @override
  State<Refferal> createState() => _RefferalState();
}

class _RefferalState extends State<Refferal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color('fff3f3f3'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Got a refferal code",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Get instant bonus in your balance!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                SizedBox(
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.left,
                    cursorColor: Colors.black87,
                    cursorWidth: 0.3,
                    cursorHeight: 15,

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter refferal code',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        // Border when not focused
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // Border when focused
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),
                ),

                SizedBox(height: 500),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 46,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,

                            // Change color as needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Text(
                            "skip",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,

                              // Ensure text is visible
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 46,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Interest(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,

                            // Change color as needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "continue",

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
