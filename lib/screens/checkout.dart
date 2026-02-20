import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/models/destination.dart';
import 'package:wanderlustventures_app/screens/home.dart';

class Checkout extends StatefulWidget {
  final Destination destination;
  final String paymentMethod;
  final int numberOfDays;
  final double totalPrice;

  const Checkout({
    super.key,
    required this.destination,
    required this.paymentMethod,
    required this.numberOfDays,
    required this.totalPrice,
    });

  @override
  State<Checkout> createState() => _CheckoutState();
}

class CheckoutDetails extends StatefulWidget {
  const CheckoutDetails({super.key});

  @override
  State<CheckoutDetails> createState() => _CheckoutDetailsState();
}

class _CheckoutDetailsState extends State<CheckoutDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle_outline),
        Text('Payment Done', style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          'Your Payment has been received. A guide assigned to you will reach out shortly. Have a lovely trip',
        ),
        SizedBox(height: 27),
      ],
    );
  }
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F0FD),
      appBar: AppBar(backgroundColor: const Color(0xFFD7F0FD)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: const CheckoutDetails(),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: SizedBox(
          // width: double.infinity,
          height: 46,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0498E5),
            ),
            child: Text(
              'Back to Explore',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
