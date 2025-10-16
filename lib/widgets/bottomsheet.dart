import 'package:flutter/material.dart';

class SubmitBottomSheet extends StatelessWidget {
  const SubmitBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Text(
            "Submit Entry",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 4),
          Text("5/5 Questions answered", style: TextStyle(color: Colors.grey)),

          SizedBox(height: 16),

          // Entry Fee & Winnings
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "₹1",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("Entry Fees", style: TextStyle(color: Colors.grey)),
                ],
              ),
              Column(
                children: [
                  Text(
                    "₹100000",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Winnings", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),

          SizedBox(height: 16),

          // Insufficient Balance Warning
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.error, color: Colors.red),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Insufficient balance",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Learn more",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle recharge
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    "Recharge",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Confirm Entry (disabled)
          Opacity(
            opacity: 0.5,
            child: ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text("Confirm Entry ₹1"),
            ),
          ),

          SizedBox(height: 8),

          // Available Balance
          Text("Available Balance: ₹0", style: TextStyle(color: Colors.grey)),

          SizedBox(height: 16),
        ],
      ),
    );
  }
}
