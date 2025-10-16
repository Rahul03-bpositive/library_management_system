import 'package:flutter/material.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  List<Map<String, dynamic>> matches = [
    {"Icon": "assets/images/ipl-icon.png", "text": "IT20L"},
    {"Icon": "assets/images/ECS.png", "text": "OELvGAM(11)"},
    {"Icon": "assets/images/NCC.png", "text": "ATvDU"},
    {"Icon": "assets/images/ipl-icon.png", "text": "IT20L"},
  ];

  @override
  Widget build(BuildContext context) {
    const IconData accountBalanceWallet = IconData(
      0xe041,
      fontFamily: 'MaterialIcons',
    );

    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      appBar: AppBar(
        backgroundColor: Color(0xff2b2b2b),
        iconTheme: IconThemeData(color: Colors.white70),
        centerTitle: true,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/cricket-ball.png",
                fit: BoxFit.cover,
                width: 17,
              ),
              SizedBox(width: 5),
              Text(
                "Cricket",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Icon(accountBalanceWallet, color: Colors.white70),
          SizedBox(width: 5),
          Text("\u20B9 15.0", style: TextStyle(color: Colors.white70)),
          SizedBox(width: 20),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Height of the bottom bar
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(157, 0, 0, 0),
                  Color.fromARGB(255, 255, 255, 255),
                ], // Gradient colors
                stops: [0.0, 0.5, 1.0],
                begin: Alignment.centerLeft,

                end: Alignment.centerRight,
              ),
            ),
            height: 0.2, // Thickness of the bar
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0xff2b2b2b),
              height: 40,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.stacked_bar_chart, color: Colors.white70),
                  SizedBox(width: 5),
                  Text("No rank", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Text(
                "Trending in this category",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 50,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  10,
                                  0,
                                  10,
                                  0,
                                ),
                                child: Image.asset(
                                  matches[index]["Icon"],
                                  // fit: BoxFit.contain,
                                  height: 29,
                                ),
                              ),
                              Text(
                                matches[index]["text"],
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 50,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  10,
                                  0,
                                  10,
                                  0,
                                ),
                                child: Image.asset(
                                  matches[index]["Icon"],
                                  // fit: BoxFit.contain,
                                  height: 29,
                                ),
                              ),
                              Text(
                                matches[index]["text"],
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 30, 20, 0),
              child: Text(
                "Live",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Container(
                height: 100,
                width: 202,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.shield_outlined,
                          size: 49,
                          color: const Color.fromARGB(132, 0, 0, 0),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'AT',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                text: ' vs ',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'DU',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.shield_outlined,
                          size: 49,
                          color: const Color.fromARGB(132, 0, 0, 0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '106/3*\n',
                            style: TextStyle(color: Colors.black87),
                            children: [TextSpan(text: '11.2 OVR')],
                          ),
                        ),
                        // SizedBox(
                        //     // width: MediaQuery.of(context).size.width * 0.07,
                        //     ),
                        Container(
                          color: const Color.fromARGB(255, 255, 102, 102),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
                            child: Text(
                              "  Live  ",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text('Yet to bat'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 30, 20, 13),
              child: Text(
                "Coming soon",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                        color: Colors.white,
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    12,
                                    10,
                                    0,
                                  ),
                                  child: Container(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      102,
                                      102,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 1,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        " MAR ",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    10,
                                    0,
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          width: 0.2,
                                          color: Colors.black54,
                                        ),
                                        right: BorderSide(
                                          width: 0.2,
                                          color: Colors.black54,
                                        ),
                                        bottom: BorderSide(
                                          width: 0.2,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(3),
                                        bottomRight: Radius.circular(3),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.8,
                                        horizontal: 11,
                                      ),
                                      child: Text(
                                        " 31 ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'KKR vs MI\n',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '07:30 PM  ',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 30, 20, 0),
              child: Text(
                "Active Event",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
              child: Column(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child: Text(
                                  "New",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Stack(
                              children: [
                                SizedBox(
                                  height: 70,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Darjeeling Unstoppables to take 4 or \nmore wickets at the end of 14 overs vs \nAlipurduar Thunders?",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 1,
                                  bottom: 4,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/hittingball.png",
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.sports_cricket,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "3 wickets @ 11.2 overs | Last 10 matches: 56 wickets",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors
                                            .blue
                                            .shade100, // Background color
                                    foregroundColor: Colors.blue, // Text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text("Yes ₹ 6.7"),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red.shade100,
                                    foregroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text("No ₹ 3.3"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
