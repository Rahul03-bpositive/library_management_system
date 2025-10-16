import 'package:app/methods/common.dart';
import 'package:app/pages/forecast.dart';
import 'package:app/pages/portfolio.dart';
import 'package:app/pages/searchpage.dart';
import 'package:app/pages/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

const String iconFont = 'CupertinoIcons';
const String iconFontPackage = 'cupertino_icons';
const IconData person = IconData(0xe491, fontFamily: 'MaterialIcons');
const IconData briefcase = IconData(
  0xf5a1,
  fontFamily: iconFont,
  fontPackage: iconFontPackage,
);
const IconData forecast_icon = IconData(
  0xe8f6,
  fontFamily: 'MaterialIcons',
); // Similar to a ticket
const IconData rewards_icon = IconData(
  0xf0d6,
  fontFamily: 'MaterialIcons',
); // Money bag alternative
const IconData account_balance_wallet = IconData(
  0xe041,
  fontFamily: 'MaterialIcons',
);
const IconData bell = IconData(
  0xf3e1,
  fontFamily: iconFont,
  fontPackage: iconFontPackage,
);

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> quickAction = [
    {
      'leading': Icon(Icons.headset_mic_outlined),
      'title': "Help",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
    {
      'leading': Icon(Icons.check_box_outline_blank),
      'title': "Invite and Earn",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
    {
      'leading': Icon(Icons.question_mark_outlined),
      'title': "Probo Academy",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
    {
      'leading': Icon(Icons.settings_outlined),
      'title': "Terms and Conditions",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
    {
      'leading': Icon(Icons.star_half_rounded),
      'title': "Rate Probo ",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
    {
      'leading': Icon(Icons.shield_moon_outlined),
      'title': "Probo Trust & Safety",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
    {
      'leading': Icon(Icons.language),
      'title': "App Language",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
  ];
  List<Map<String, dynamic>> categories = [
    {'icon': 'assets/images/cricket-ball.png', 'label': 'Cricket'},
    {'icon': 'assets/images/binance.png', 'label': 'Crypto'},
    {'icon': 'assets/images/youtube.png', 'label': 'Youtube'},
    {'icon': 'assets/images/three-dots.png', 'label': 'Show More'},
  ];
  List<Map<String, dynamic>> Banner = [
    {'icon': 'assets/images/banner.webp'},
    {'icon': 'assets/images/banner1.webp'},
  ];
  List<Map<String, dynamic>> trending = [
    {
      'label': 'Cricket',
      'details': 'Rajasthan\nChennai',
      'icon': 'assets/images/clearback.png',
    },
    {'label': 'Stock', 'details': 'Stock', 'icon': 'assets/images/removeS.png'},
    {
      'label': 'YouTube',
      'details': 'Youtube',
      'icon': 'assets/images/removeY.png',
    },
  ];

  bool isSwitched = false;

  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      key: _scaffoldKey,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.fromLTRB(9, 0, 0, 0),
          width: 10,
          height: 10,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(130, 0, 0, 0),
                width: 0.7,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer(); // Open the drawer
                },
                icon: Icon(person, size: 20),
              ),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Wallet()),
                  );
                },
                child: Icon(account_balance_wallet, size: 20),
              ),
              SizedBox(width: 29),
              Image.asset("assets/images/images.png"),
              SizedBox(width: 29),
              Icon(bell, size: 20),
              SizedBox(width: 19),
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Height of the bottom bar
          child: Container(
            color: const Color.fromARGB(255, 0, 0, 0), // Customize the color
            height: 0.1, // Thickness of the bar
          ),
        ),
      ),
      drawer: Padding(
        padding: EdgeInsets.zero,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 1,
          child: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.36,
                  child: DrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 19,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffcccccc),
                                  width: 0.7,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CircleAvatar(
                                  radius: 50,
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color.fromARGB(
                                    164,
                                    204,
                                    204,
                                    204,
                                  ),
                                  child: Icon(Icons.person, size: 60),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10.2, 0, 0),
                              child: Text(
                                "Prober",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Followers"),
                            SizedBox(width: 4),
                            Text("0"),
                            SizedBox(width: 10),
                            Icon(Icons.circle, size: 11),
                            SizedBox(width: 10),
                            Text("Following"),
                            SizedBox(width: 4),
                            Text("1"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 130,
                        child: Positioned(
                          top: 0,
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffededed),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      8.0,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.currency_rupee_sharp),
                                        Text("\u20B9 25"),
                                        Text(
                                          "Balance",
                                          style: TextStyle(
                                            color: Color(0xff838383),
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 380, // 👈 Add a fixed height to prevent layout errors
                  width:
                      MediaQuery.of(
                        context,
                      ).size.width, // 👈 Ensure proper width
                  child: ListView.builder(
                    itemCount: quickAction.length,
                    itemBuilder: (context, index) {
                      return listtile1(quickAction, index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(color: Color(0xfff3f3f3)),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 6,
                        ),
                        child: Container(
                          height: 70,
                          width: 90,
                          padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Image.asset(
                                  categories[index]['icon'],
                                  height: 33,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                categories[index]['label'],
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: Banner.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        Banner[index]['icon'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.transparent),
                          ),
                          child: CupertinoSwitch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            // activeTrackColor: Colors.red[500],
                            // inactiveTrackColor: Colors.grey[300],
                            // inactiveThumbColor: Colors.white,
                            activeTrackColor:
                                Colors.red, // Minimalist white color
                            inactiveTrackColor:
                                Colors.white, // Removes the track border
                          ),
                        ),
                      ),
                      Text(
                        'Live',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: 17,
                        width: 2,
                        decoration: BoxDecoration(color: Colors.grey[500]),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios_outlined, size: 14),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width * 1,
              child: ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 13),
                    width: MediaQuery.of(context).size.width * 0.429,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(trending[index]["label"]),
                              Text(trending[index]["details"]),
                            ],
                          ),
                          Image.asset(
                            trending[index]['icon'],
                            height: 80,
                            width: 92.1,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width * 1,
              child: ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 13),
                    width: MediaQuery.of(context).size.width * 0.429,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(trending[index]["label"]),
                              Text(trending[index]["details"]),
                            ],
                          ),
                          Image.asset(
                            trending[index]['icon'],
                            height: 80,
                            width: 92.1,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending Market',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: const Color.fromARGB(62, 0, 0, 0),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 5, 8, 5),
                      child: Row(
                        children: [
                          Icon(Icons.swap_horiz_outlined, size: 14),
                          SizedBox(width: 15),
                          Text(
                            'Relevance',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
            //   child: SizedBox(
            //     height: 300,
            //     width: MediaQuery.of(context).size.width * 1,
            //     child: ListView.builder(
            //         itemCount: 4,
            //         scrollDirection: Axis.vertical,
            //         itemBuilder: (context, index) {
            //           return Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Card(
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //               elevation: 3,
            //               child: Padding(
            //                 padding: EdgeInsets.all(12.0),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         Icon(Icons.people,
            //                             size: 18, color: Colors.grey),
            //                         SizedBox(width: 5),
            //                         Text("407697 traders",
            //                             style: TextStyle(color: Colors.grey)),
            //                       ],
            //                     ),
            //                     SizedBox(height: 10),
            //                     Stack(children: [
            //                       SizedBox(
            //                         height: 70,
            //                         child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             Text(
            //                               "Hyderabad to win the match vs\n Lucknow?",
            //                               style: TextStyle(
            //                                   fontSize: 16,
            //                                   fontWeight: FontWeight.bold),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                       Positioned(
            //                         right: 1,
            //                         bottom: -20,
            //                         child: Row(
            //                           children: [
            //                             Image.asset(
            //                               "assets/clearback.png",
            //                               width: 110,
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ]),
            //                     SizedBox(height: 5),
            //                     Row(
            //                       children: [
            //                         Icon(Icons.sports_cricket,
            //                             size: 18, color: Colors.grey),
            //                         SizedBox(width: 5),
            //                         Text(
            //                             "H2H last 5 T20: Hyderabad 1, Lucknow 3, DRAW 0",
            //                             style: TextStyle(color: Colors.grey)),
            //                       ],
            //                     ),
            //                     SizedBox(height: 10),
            //                     Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceEvenly,
            //                       children: [
            //                         ElevatedButton(
            //                           style: ElevatedButton.styleFrom(
            //                             backgroundColor: Colors.blue
            //                                 .shade100, //for background color
            //                             foregroundColor:
            //                                 Colors.blue, // for text color
            //                             shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                                   BorderRadius.circular(20),
            //                             ),
            //                           ),
            //                           onPressed: () {},
            //                           child: Text("Yes ₹ 6.7"),
            //                         ),
            //                         ElevatedButton(
            //                           style: ElevatedButton.styleFrom(
            //                             backgroundColor: Colors.red.shade100,
            //                             foregroundColor: Colors.red,
            //                             shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                                   BorderRadius.circular(20),
            //                             ),
            //                           ),
            //                           onPressed: () {},
            //                           child: Text("No ₹ 3.3"),
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           );
            //         }),
            //   ),
            // )
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
                            Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "407697 traders",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
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
                                        "Hyderabad to win the match vs\n Lucknow?",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 1,
                                  bottom: -20,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/clearback.png",
                                        width: 110,
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
                                  "H2H last 5 T20: Hyderabad 1, Lucknow 3, DRAW 0",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 010,
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        selectedIconTheme: IconThemeData(size: 26),
        unselectedIconTheme: IconThemeData(size: 24),
        type: BottomNavigationBarType.fixed, // Ensure all items show labels
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: "Forecast",
          ),
          BottomNavigationBarItem(icon: Icon(briefcase), label: "Portfolio"),
          BottomNavigationBarItem(icon: Icon(rewards_icon), label: "Rewards"),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Searchpage()));
    } else if (index == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Portfolio()));
    } else if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Forecast()));
    }
  }
}
