import "package:flutter/material.dart";
import 'package:wanderlustventures_app/screens/checkout.dart';
import 'package:wanderlustventures_app/models/destination.dart';
import 'package:wanderlustventures_app/widgets/crypto_details.dart';
import 'package:wanderlustventures_app/widgets/mpesa_details.dart';
import 'package:wanderlustventures_app/widgets/paypal_details.dart';
import 'package:wanderlustventures_app/widgets/card_details.dart';

class PaymentDetails extends StatelessWidget {
  final Destination destination;
  final String paymentMethod;
  final int numberOfDays;
  final double totalPrice;

  const PaymentDetails({
    super.key,
    required this.destination,
    required this.paymentMethod,
    required this.numberOfDays,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    // decide which idget to show based on payment method
    Widget paymentForm;

    if (paymentMethod == 'card') {
      paymentForm = CardDetails(
        destination: destination,
        numberOfDays: numberOfDays,
        totalPrice: totalPrice,
      );
    } else if (paymentMethod == 'paypal') {
      paymentForm = PaypalDetails(
        destination: destination,
        numberOfDays: numberOfDays,
        totalPrice: totalPrice,
      );
    } else if (paymentMethod == 'crypto') {
      paymentForm = CryptoDetails(
        destination: destination,
        numberOfDays: numberOfDays,
        totalPrice: totalPrice,
      );
    } else if (paymentMethod == 'm-pesa') {
      paymentForm = MpesaDetails(
        destination: destination,
        numberOfDays: numberOfDays,
        totalPrice: totalPrice,
      );
    } else {
      paymentForm = Center(child: Text('Payment method not supported'));
    }

    return Scaffold(
      backgroundColor: const Color(0xFFD7F0FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD7F0FD),
        title: Text('Pay with ${paymentMethod.toUpperCase()}'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: paymentForm,
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
                MaterialPageRoute(
                  builder: (context) => Checkout(
                    destination: destination,
                    paymentMethod: paymentMethod,
                    numberOfDays: numberOfDays,
                    totalPrice: totalPrice,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0498E5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Pay Now with ${paymentMethod.toUpperCase()}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
