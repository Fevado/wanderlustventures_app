import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/screens/payment_details.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Make Payment', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Pay with:', style: TextStyle(fontWeight: FontWeight.w600)),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0498E5),
          ),
          child: Text(
            'PayPal',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentDetails()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0498E5),
          ),
          child: Text(
            'Card',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0498E5),
          ),
          child: Text(
            'Crypto',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F0FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD7F0FD),
        leading: Icon(Icons.menu),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [const PaymentOptions()]),
          ),
        ),
      ),
    );
  }
}
