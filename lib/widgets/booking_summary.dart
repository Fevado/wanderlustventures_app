import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/models/destination.dart';

class BookingSummary extends StatelessWidget {
  final Destination destination;
  final int numberOfDays;
  final double totalPrice;

  const BookingSummary({
    super.key,
    required this.destination,
    required this.numberOfDays,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: const Color.fromARGB(255, 98, 198, 241),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Destination: ${destination.name}', style: TextStyle(fontWeight: FontWeight.w600),),
                Text('Number of Days: $numberOfDays', style: TextStyle(fontWeight: FontWeight.w600),),
                Text('Price per day: \$${destination.pricePerDay}', style: TextStyle(fontWeight: FontWeight.w600),),
                Text('Total: \$$totalPrice', style: TextStyle(fontWeight: FontWeight.w600),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
