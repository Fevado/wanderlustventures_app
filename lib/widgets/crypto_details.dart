import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/models/destination.dart';
import 'package:wanderlustventures_app/widgets/booking_summary.dart';

class CryptoDetails extends StatelessWidget {
  final Destination destination;
  final int numberOfDays;
  final double totalPrice;

  const CryptoDetails({
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
          'Cryptocurrency',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 16),

        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          ),
          initialValue: 'BTC',
          items: ['BTC', 'ETH', 'USDT'].map((currency) {
            return DropdownMenuItem(
              value: currency,
              child: Text(currency),
            );
          }).toList(),
          onChanged: (value){},
        ),

        SizedBox(height: 16),

        // wallet address
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Your wallet address',
            filled: true,
            fillColor: const Color(0xFFC5E9FC),
            prefixIcon: Icon(Icons.account_balance_wallet),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),

        SizedBox(height: 20),

        // Payment details
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(children: [
            Text('Amount in USD: \$$totalPrice'),
            Text('BTC: ${(totalPrice/50000).toStringAsFixed(6)}')
          ],),
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
