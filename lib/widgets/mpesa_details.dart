import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/models/destination.dart';
import 'package:wanderlustventures_app/widgets/booking_summary.dart';

class MpesaDetails extends StatelessWidget {
  final Destination destination;
  final int numberOfDays;
  final double totalPrice;

  const MpesaDetails({
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
          'M-Pesa Mobile Money',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 16),

        // phone number field
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Enter M-Pesa phone number',
            prefixText: '+254 ',
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
            prefixIcon: Icon(Icons.phone_android),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          ),
        ),

        SizedBox(height: 20),

        // Instructions to user
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: [
              Text(
                'You will receive an STK Push prompt on your phone',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'Enter your M-pesa PIN to complete payment',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
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
