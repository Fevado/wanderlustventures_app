import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/models/destination.dart';
import 'package:wanderlustventures_app/widgets/booking_summary.dart';

class PaypalDetails extends StatelessWidget {
  final Destination destination;
  final int numberOfDays;
  final double totalPrice;

  const PaypalDetails({
    super.key,
    required this.destination,
    required this.numberOfDays,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'PayPal',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 16),

        // email field
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Paypal email address',
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
            prefixIcon: Icon(Icons.email_rounded),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          ),
        ),

        SizedBox(height: 12),

        // password field
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          ),
        ),

        SizedBox(height: 20),

        // Paypal branding
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              Icon(Icons.payment, color: Colors.blue),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'You will be redirected to Paypal to complete Payment',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        BookingSummary(
          destination: destination, 
          numberOfDays: numberOfDays, 
          totalPrice: totalPrice
          )
      ],
    );
  }
}
