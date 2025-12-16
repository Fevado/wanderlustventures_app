import "package:flutter/material.dart";
import 'package:wanderlustventures_app/screens/checkout.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class CardDetails extends StatefulWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Card', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: 'Card Number',
            hintStyle: TextStyle(fontSize: 15),
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
            prefixIcon: Icon(Icons.credit_card),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          ),
        ),

        SizedBox(height: 20),

        Row(
          children: [
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                constraints: BoxConstraints(maxWidth: 180),
                hintText: 'Expire date',
                hintStyle: TextStyle(fontSize: 15),
                filled: true,
                fillColor: const Color(0xFFC5E9FC),
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),

            Spacer(),

            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                constraints: BoxConstraints(maxWidth: 180),
                hintText: 'CVV',
                hintStyle: TextStyle(fontSize: 15),
                filled: true,
                fillColor: const Color(0xFFC5E9FC),
                prefixIcon: Icon(Icons.credit_card_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 20),
        Column(
          children: [
            Row(children: [Text('Number of people'), Spacer(), Text('1')]),
            Row(children: [Text('Number of days'), Spacer(), Text('1')]),
            Row(children: [Text('Total'), Spacer(), Text('\$196')]),
          ],
        ),
        SizedBox(height: 27),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Checkout()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0498E5),
          ),
          child: Text(
            'Pay Now',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F0FD),
      appBar: AppBar(
        backgroundColor: Color(0xFFD7F0FD),
        leading: Icon(Icons.menu),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [const CardDetails()]),
          ),
        ),
      ),
    );
  }
}
