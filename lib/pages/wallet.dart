import 'package:app/methods/common.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  static const IconData currency_exchange_outlined = IconData(
    0xf05d6,
    fontFamily: 'MaterialIcons',
  );
  static const IconData speed = IconData(0xe5e0, fontFamily: 'MaterialIcons');
  static const IconData person = IconData(0xe491, fontFamily: 'MaterialIcons');
  static const IconData email = IconData(0xe22a, fontFamily: 'MaterialIcons');
  List<Map<String, dynamic>> QuickAction = [
    {
      'leading': Icon(currency_exchange_outlined),
      'title': "Transaction History",
      'subtitle': "for all balance debits & credits",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
    {
      'leading': Icon(Icons.check_box_outline_blank),
      'title': "Probo vault",
      'subtitle': "for financial disciplane",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
    {
      'leading': Icon(person),
      'title': "KYC Verification",
      'subtitle': "Tap to verify",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
    {
      'leading': Icon(speed),
      'title': "Control Center",
      'subtitle': "Limit for responsible trading",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
    {
      'leading': Icon(email),
      'title': "Statements & Certificate ",
      'subtitle': "For ledger and TDS certificates",
      'trailing': Icon(Icons.chevron_right_sharp),
    },
  ];
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: AppBar(
        backgroundColor: Color(0xfff6f6f6),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            size: 23, // Reduce size
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Balance",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 19),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: Container(
            height: 0.1,
            color: const Color.fromARGB(175, 0, 0, 0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 90,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/banner.webp', fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "\u20B9 25",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),
              Text(
                "Total Balance",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.account_balance_wallet_outlined),
                                    SizedBox(width: 10),
                                    Text("Deposit\n \u20B9 0"),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Recharge",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Divider(color: Colors.black12),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _isExpanded
                                    ? "Close Breakdown"
                                    : "View Breakdown",
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isExpanded = !_isExpanded;
                                  });
                                },
                                child: Icon(
                                  _isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          if (_isExpanded)
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.bolt_outlined,
                                        size: 19,
                                        color: Colors.black45,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Recharged balance",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.black45,
                                        size: 19,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    child: Text(
                                      "\u20B9 0",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Divider(color: Colors.black12),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.trending_up_outlined,
                                                size: 19,
                                                color: Colors.black45,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "Trending balance",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(
                                                Icons.info_outline,
                                                color: Colors.black45,
                                                size: 19,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                              26,
                                              0,
                                              0,
                                              0,
                                            ),
                                            child: Text(
                                              "\u20B9 0",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Cash Out",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 15,
                                              color: Colors.black,
                                              weight: 100,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.emoji_events_outlined, size: 30),
                                    SizedBox(width: 10),
                                    Text("Deposit\n \u20B9 0"),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    11,
                                    0,
                                    0,
                                    0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Withdraw",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Divider(color: Colors.black12),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Complete KYC to Withdraw funds",
                                style: TextStyle(color: Colors.red),
                              ),
                              Icon(Icons.chevron_right_rounded),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.gift,
                                      size: 30,
                                      color: const Color.fromARGB(
                                        142,
                                        160,
                                        14,
                                        239,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text("Promotional\n \u20B9 25"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Quick actions",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(
                height: 370,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return listtile(QuickAction, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
