// import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';

import 'package:app/pages/refferal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app/methods/common.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async' as async;

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  int resendtime = 10;
  // Countdown timer starting value
  bool _showTimer = true;
  async.Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      resendtime = 10;
      _showTimer = true; // Show the timer again
    });
    _timer?.cancel();
    _timer = async.Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendtime > 0) {
        setState(() {
          resendtime--;
        });
      } else {
        setState(() {
          _showTimer = false;
        });
        timer.cancel();
      }
    });
  }

  void _onResendPressed() {
    _startTimer();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('OTP Resent')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color('fff3f3f3'),
      appBar: AppBar(
        backgroundColor: color('fff3f3f3'),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Verify phone",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                // SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "OTP has been sent to 6375724902",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    cursorColor: Colors.black,
                    cursorHeight: 20,
                    animationDuration: Duration.zero,
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      borderWidth: 0,
                      fieldHeight: 50,
                      fieldWidth: 42,

                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,

                      activeBorderWidth: 0, // Border width when active
                      inactiveBorderWidth: 0, // Border width when inactive
                      selectedBorderWidth: 0,

                      activeColor: Colors.grey.shade400,
                      inactiveColor: Colors.grey.shade400,
                      selectedColor: Colors.grey.shade500,

                      // inactiveFillColor: Colors.grey.shade100,
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    InkWell(
                      onTap: _showTimer ? null : _onResendPressed,
                      child: const Text(
                        "Resend OTP",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    if (_showTimer)
                      Text(
                        "$resendtime sec",

                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 56, 96, 254),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 380),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // Adds spacing
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          "This game may be habit-forming or financially risky. Play responsibly. ",
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                      children: [
                        TextSpan(
                          text: "Terms and Conditions",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black, // Makes it look like a link
                            fontWeight: FontWeight.bold,
                            decoration:
                                TextDecoration
                                    .underline, // Underline for link effect
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text:
                              " apply, for 18+ only. Participation as per state laws.",
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: double.infinity, // Full-width button
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Refferal()),
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
                      "Verify",
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
