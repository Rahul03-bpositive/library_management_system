import 'package:app/data.dart';
import 'package:app/pages/enternow.dart';

import 'package:flutter/material.dart';

class Forecastcard extends StatefulWidget {
  const Forecastcard({super.key});

  @override
  State<Forecastcard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<Forecastcard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // height: 415,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.lightBlue.shade100],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Positioned.fill(
                      child: SafeArea(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },

                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(
                            Icons.timelapse,
                            color: Colors.red,
                            size: 15,
                          ),
                        ), // Wallet icon
                        SizedBox(width: 3), // Space between icon and text
                        Text(
                          '13 hours left',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'jackpot',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          '5 ouestion',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Bengaluru vs Gujarat – \nLakhpati contest',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header row
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Guranteed Prize Pool',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '₹2.5 lakh',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                  child: Text(
                                    isExpanded ? 'Hide' : 'See Detail',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Expanded content (only visible when isExpanded = true)
                          if (isExpanded)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey[100],
                                ),
                                child: Table(
                                  children: [
                                    _buildRow("RANK", "PRIZE", bold: true),
                                    _buildRow("1", "₹ 100000"),
                                    _buildRow("2", "₹ 50000"),
                                    _buildRow("3", "₹ 25000"),
                                    _buildRow("4-10", "₹ 1000"),
                                    _buildRow("11-2000", "₹ 10"),
                                    _buildRow("2001-50000", "₹ 1"),
                                  ],
                                ),
                              ),
                            ),
                          Center(child: SizedBox(width: 300, child: Divider())),
                          // Bottom row
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '4,55,399 Spots Left',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      '5,00,000 Spots',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                LinearProgressIndicator(
                                  value: 455399 / 500000,
                                  backgroundColor: Colors.grey[300],
                                  minHeight: 5,

                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Stay tuned for leaderboard',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'Entries are open , ranking go live once the event\nsettles ',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                        wordSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 500,
                height: 8,
                color: Colors.grey.shade300,
                // child: Divider(),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Rules and info',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Column(
                children:
                    infoData.entries.map((entry) {
                      final isLast = entry.key == infoData.keys.last;
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    entry.key,
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    entry.value,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (!isLast)
                            SizedBox(
                              width: 350,
                              child: Divider(
                                height: 24,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                                color: Colors.grey[300],
                              ),
                            ), // Divider between rows
                        ],
                      );
                    }).toList(),
              ),
              SizedBox(width: 350, child: Divider(color: Colors.grey.shade300)),

              // SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side: Title
                    Text(
                      'Rules',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Spacing between title and bullet list
                    SizedBox(width: 85),

                    // Right side: Bullet list
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bulletText(
                            "The final declared winner",
                            " will be considered in cases like Super Over, Match Awarded, or as per tournament rules.",
                          ),
                          bulletText(
                            "If two or more players",
                            " have the same score, the one with the highest strike rate will be favored.",
                          ),
                          bulletText(
                            "The sum of fours and sixes",
                            " in the mentioned innings will be counted.",
                          ),
                          bulletText(
                            "In case of an abandoned match",
                            ", the forecast will be void.",
                          ),
                          bulletText(
                            "For reduced overs or stoppages",
                            ", settlement follows the final result.",
                          ),
                          bulletText(
                            "If the innings is completed",
                            " at stoppage, the forecast settles as per the final result.",
                          ),
                          bulletText(
                            "If DLS Method decides the match",
                            ", the forecast follows the final result.",
                          ),
                          bulletText(
                            "Spots may increase",
                            " with more users, leading to a bigger prize pool and more winners.",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '₹1',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3),
                Text(
                  'entry fee',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Enternow()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                backgroundColor: Color(0xFFCCF24E), // Neon green-ish
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Enter Now',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bulletText(String boldText, String normalText) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("• ", style: TextStyle(fontSize: 20, color: Colors.black54)),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 14),
              children: [
                TextSpan(
                  text: boldText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                TextSpan(
                  text: normalText,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

TableRow _buildRow(String left, String right, {bool bold = false}) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
        child: Text(
          left,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
        child: Text(
          right,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    ],
  );
}

// fixed foooter add karna hai 
//and want to see the space between the keys and values 
//and animation rocket animation 