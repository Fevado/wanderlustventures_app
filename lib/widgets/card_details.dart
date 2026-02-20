import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/models/destination.dart';
import 'package:wanderlustventures_app/widgets/booking_summary.dart';
// import 'package:wanderlustventures_app/screens/payments.dart';

class CardDetails extends StatelessWidget {
  final Destination destination;
  final int numberOfDays;
  final double totalPrice;

  const CardDetails({
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
      const Text('Card', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 16),

      TextFormField(
        decoration: InputDecoration(
          hintText: 'Card Number',
          filled: true,
          fillColor: const Color(0xFFC5E9FC),
          prefixIcon: Icon(Icons.credit_card),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(22),
          ),
        ),
      ),

      const SizedBox(height: 20,),

      Row(
        children: [
          Expanded(
            child:TextFormField(
              decoration: InputDecoration(
                hintText: 'Expire Date',
                filled: true,
                fillColor: const Color(0xFFC5E9FC),
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            ),
            const SizedBox(width: 12,),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'CVV',
                  filled: true,
                  fillColor: const Color(0xFFC5E9FC),
                  prefixIcon: Icon(Icons.credit_card),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ),
        ],
      ),

      const SizedBox(height: 20,),

      BookingSummary(
        destination: destination, 
        numberOfDays: numberOfDays, 
        totalPrice: totalPrice
        )
  ]
);
}
}
