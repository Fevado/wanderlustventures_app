import "package:flutter/material.dart";
import 'package:wanderlustventures_app/screens/checkout.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Card', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),

        TextField(
          decoration: InputDecoration(
            hintText: 'Card Number',
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
            prefixIcon: Icon(Icons.credit_card),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          ),
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Expire date',
                  filled: true,
                  fillColor: const Color(0xFFC5E9FC),
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'CVV',
                  filled: true,
                  fillColor: const Color(0xFFC5E9FC),
                  prefixIcon: Icon(Icons.credit_card_off_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        Column(
          children: const [
            Row(children: [Text('Number of people'), Spacer(), Text('1')]),
            Row(children: [Text('Number of days'), Spacer(), Text('1')]),
            Row(children: [Text('Total'), Spacer(), Text('\$196')]),
          ],
        ),
      ],
    );
  }
}

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F0FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD7F0FD),
        leading: const Icon(Icons.menu),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: const CardDetails(),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: SizedBox(
          height: 46,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Checkout()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0498E5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ), 
            child: const Text(
              'Pay Now',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),           
          ),
        ),
      ),
    );
  }
}
