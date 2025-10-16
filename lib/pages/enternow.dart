import 'package:app/widgets/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:app/data.dart';

class Enternow extends StatefulWidget {
  const Enternow({super.key});

  @override
  State<Enternow> createState() => _EnternowState();
}

class _EnternowState extends State<Enternow> {
  int filledCount = 0; // Example: 3 questions filled
  int totalQuestions = 5;
  String? selectedCity;
  String? selectedplayer;
  TextEditingController Controller1 = TextEditingController();
  TextEditingController Controller2 = TextEditingController();
  TextEditingController Controller3 = TextEditingController();

  void updateFilledCount() {
    int count = 0;

    if (Controller1.text.trim().isNotEmpty) count++;
    if (Controller2.text.trim().isNotEmpty) count++;
    if (Controller3.text.trim().isNotEmpty) count++;

    if (selectedCity != null) count++;
    if (selectedplayer != null) count++;

    setState(() {
      filledCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.lightBlue.shade100, Colors.grey.shade100],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Chennai vs Kolkata - Lakhpati conte...',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),

                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '200 pts',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'who will win the match?',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              ...cities.map((city) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),

                  child: RadioListTile<String>(
                    value: city,
                    groupValue: selectedCity,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                      updateFilledCount();
                    },
                    title: Text(city),
                    activeColor: Colors.blue,
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              }),

              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),

                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '500 pts',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Total Runs in the Match',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              Container(
                // width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: Controller1,
                  onChanged: (_) => updateFilledCount(),
                  cursorColor: Colors.black,
                  cursorHeight: 18,
                  decoration: InputDecoration(
                    hintText: 'Type your answer',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 15,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ), // Blue border on focus
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 10),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),

                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '300 pts',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Total wickets in the Match',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),

                child: TextField(
                  controller: Controller2,
                  onChanged: (_) => updateFilledCount(),
                  cursorColor: Colors.black,
                  cursorHeight: 18,
                  decoration: InputDecoration(
                    hintText: 'Type your answer',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 15,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ), // Blue border on focus
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),

                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '200 pts',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'who will win the match?',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              ...players.map((players) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: RadioListTile<String>(
                    value: players,
                    groupValue: selectedplayer,
                    onChanged: (value) {
                      setState(() {
                        selectedplayer = value;
                      });
                      updateFilledCount();
                    },
                    title: Text(players),
                    activeColor: Colors.blue,

                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              }),

              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 10),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),

                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '300 pts',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Highest Score by a Player in the Match',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              Container(
                // width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: Controller3,
                  onChanged: (_) => updateFilledCount(),
                  cursorColor: Colors.black,
                  cursorHeight: 18,
                  decoration: InputDecoration(
                    hintText: 'Type your answer',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 15,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ), // Blue border on focus
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        decoration: BoxDecoration(
          color: Colors.white,

          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -1),
              blurRadius: 6,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            // Filled progress bar
            FractionallySizedBox(
              widthFactor: filledCount / totalQuestions,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.lightBlue.shade100, Colors.grey.shade100],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$filledCount / $totalQuestions',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (filledCount == totalQuestions)
                    SizedBox(
                      height: 50,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          // side: BorderSide(
                          //   color: Colors.blue,
                          // ), // optional border
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (_) => SubmitBottomSheet(),
                          );
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
