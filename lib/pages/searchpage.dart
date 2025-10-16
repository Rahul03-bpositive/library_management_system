import 'package:app/methods/common.dart';
import 'package:app/pages/searchbody.dart';
import 'package:app/widgets/gridviewbuilder.dart';
import 'package:app/widgets/horizontalcardlist.dart';
import 'package:flutter/material.dart';
import 'package:app/data.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});
  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color('fff3f3f3'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.left,
                    cursorColor: Colors.black87,
                    cursorWidth: 0.5,
                    cursorHeight: 15,

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintText: 'search probo',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchBody(),
                            ),
                          );
                        },
                        icon: Icon(Icons.search),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 0.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 0.5,
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 30),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "All categories",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                GridViewBuilder(items: items),

                // const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Currently",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),

                        child: Text(
                          "Live",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                HorizontalCardList(items: items1),
                const SizedBox(height: 8),
                HorizontalCardList(items: items2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
