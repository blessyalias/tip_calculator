// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class TipCalculatorPage extends StatefulWidget {
  @override
  _TipCalculatorPageState createState() => _TipCalculatorPageState();
}

class _TipCalculatorPageState extends State<TipCalculatorPage> {
  double billAmount = 0.0;
  double totalAmount = 0.0;
  int selectedTipPercentage = 15;

  final List<int> tipPercentages = [15, 20, 25];
  TextEditingController billAmountController = TextEditingController();

  void calculateTotal() {
    setState(() {
      billAmount = double.tryParse(billAmountController.text) ?? 0.0;
      totalAmount = billAmount + (billAmount * selectedTipPercentage / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300]
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          
                    // Profile 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/images/img.jpg"), 
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Welcome back!",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60),

                      //input for bill amt & tip percentage
                      Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Colors.amber,
              ),
              height: 300, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20), 
                    child: Center(
                      child: TextField(
                        controller: billAmountController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center, 
                        decoration: InputDecoration(
                          hintText: "Enter Bill Amount",
                          hintStyle: TextStyle(color: Colors.grey[600]), 
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                        onChanged: (value) {
                          calculateTotal(); 
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20), 
                    child: Center(
                      child: DropdownButton<int>(
                        value: selectedTipPercentage,
                        onChanged: (newValue) {
                          setState(() {
                            selectedTipPercentage = newValue!;
                          });
                          calculateTotal(); 
                        },
                        items: tipPercentages.map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              '$value%',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Total Amt
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.red[400],
            ),
            height: 90,
            child: Center(
              child: Text(
                "Total Amount: ${totalAmount.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}