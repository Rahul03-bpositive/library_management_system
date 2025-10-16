import 'package:app/data.dart';
import 'package:app/methods/common.dart';
import 'package:app/pages/forecastcard.dart';

import 'package:flutter/material.dart';

class Forecast extends StatefulWidget {
  const Forecast({super.key});

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
            child: Column(
              children: [
                Container(
                  height: 415,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(25),
                          ),

                          child: Image.asset(
                            'assets/images/sunrays.jpg', // Your sunray background
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Positioned.fill(
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 0,
                              right: 0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform.translate(
                                      offset: Offset(-10, 0),
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
                                    SizedBox(width: 110),

                                    Center(
                                      child: Transform.translate(
                                        offset: Offset(-25, 0),
                                        child: Text(
                                          'Forecast',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    Container(
                                      child: Icon(
                                        Icons.account_balance_wallet_outlined,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ), // Wallet icon
                                    SizedBox(
                                      width: 5,
                                    ), // Space between icon and text
                                    Text(
                                      '₹ 15.00',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform.scale(
                                      scaleY: 0.4,
                                      // scaleX: 0.4, // Makes one end thinner
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: 40,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(10),
                                            right: Radius.circular(0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      ' NAME ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    Transform.scale(
                                      scaleY: 0.4,
                                      // scaleX: 0.1,
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        width: 40,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(0),
                                            right: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: Text(
                                    'FORECAST',
                                    style: TextStyle(
                                      fontSize: 40,

                                      fontWeight: FontWeight.w900,
                                      color: const Color.fromARGB(
                                        255,
                                        104,
                                        131,
                                        36,
                                      ),
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.table_rows,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'My Entries',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
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
                      //card section
                      Positioned(
                        top: 220, // Adjust this to sit under "My Entries"
                        left: 12,
                        right: 12,
                        child: Container(
                          constraints: BoxConstraints(
                            maxHeight: 175, //
                          ),
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Forecastcard(),
                                    ),
                                  );
                                },
                                child: Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 4,

                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Top Row
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.emoji_events,
                                                  size: 18,
                                                  color: Colors.blue,
                                                ),
                                                SizedBox(width: 6),
                                                Text(
                                                  "Jackpot",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: color('FFE7EBFF'),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 14,
                                                    color: Colors.blue,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    "FORECAST OF THE DAY",
                                                    style: TextStyle(
                                                      color:
                                                          Colors.blue.shade700,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 10),

                                        // Title
                                        Text(
                                          "Bengaluru vs Gujarat – Lakhpati contest",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                          ),
                                        ),

                                        SizedBox(height: 6),

                                        // Prize and Entry Fee
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "₹2.5 Lakh",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 28,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.green.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Text(
                                                "₹1",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 8),

                                        // Spots Left
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "4,25,884 Spots Left",
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              "5,00,000 Spots",
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 4),

                                        // Progress Bar
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            0,
                                          ),
                                          child: LinearProgressIndicator(
                                            value: 425884 / 500000,
                                            backgroundColor:
                                                Colors.grey.shade300,
                                            color: Colors.black,
                                            minHeight: 4,
                                          ),
                                        ),

                                        SizedBox(height: 8),

                                        // Footer Info
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              size: 12,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              " 100000",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Icon(
                                              Icons.groups,
                                              size: 12,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              " 10% Winners",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'TOP FORECAST',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: contests.length,
                  shrinkWrap: true, // Tells it to take only needed height
                  physics:
                      NeverScrollableScrollPhysics(), // Prevents nested scroll conflicts
                  padding: EdgeInsets.all(18),
                  itemBuilder: (context, index) {
                    final contest = contests[index];
                    final double progress =
                        contest["spotsLeft"] / contest["totalSpots"];
                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top label
                            Row(
                              children: [
                                Icon(
                                  Icons.rocket,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Jackpot",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 6),

                            // Title
                            Text(
                              contest["title"],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),

                            SizedBox(height: 8),

                            // Prize and Entry Fee
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  contest["prize"],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 28,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    contest["entryFee"],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 8),

                            // Spots Left and Total
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${contest["spotsLeft"]} Spots Left",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Text(
                                  "${contest["totalSpots"]} Spots",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 4),

                            // Progress bar
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: 3,
                                backgroundColor: Colors.grey.shade300,
                                color: Colors.black87,
                              ),
                            ),

                            SizedBox(height: 10),

                            // Footer
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  contest["minWinAmount"],
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(width: 16),
                                Icon(
                                  Icons.emoji_events,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "${contest["winnersPercent"]} Winners",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
