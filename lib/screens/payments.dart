import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/screens/payment_details.dart';
import 'package:wanderlustventures_app/models/destination.dart';

class Payments extends StatefulWidget {
  final Destination destination;
  const Payments({super.key, required this.destination});

  @override
  State<Payments> createState() => _PaymentsState();
}

class PaymentOptions extends StatefulWidget {
  final Destination destination;
  final Function(String) onMethodSelected;
  final String? selectedMethod;
  final int selectedDays;
  final VoidCallback onIncreaseDays;
  final VoidCallback onDecreaseDays;

  const PaymentOptions({
    super.key,
    required this.destination,
    required this.onMethodSelected,
    required this.selectedMethod,
    required this.selectedDays,
    required this.onIncreaseDays,
    required this.onDecreaseDays,
  });

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
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
                Text(
                  'Booking Summary',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Destination: ${widget.destination.name}'),
                Text('Price per Day: \$${widget.destination.pricePerDay}'),

                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.remove, color: Colors.white),
                        onPressed: widget.onDecreaseDays,
                      ),
                    ),
                    // Days display
                    SizedBox(width: 20),
                    Text(
                      '${widget.selectedDays} ${widget.selectedDays == 1 ? 'Day' : 'Days'}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20),

                    // plus button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add, color: Colors.white),
                        onPressed: widget.onIncreaseDays,
                      ),
                    ),
                  ],
                ),
                // Total price
                SizedBox(height: 20),
                Text(
                  'Total: \$${widget.destination.pricePerDay * widget.selectedDays}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Text('Make Payment', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Pay with:', style: TextStyle(fontWeight: FontWeight.w600)),

        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton(
            onPressed: () {
              widget.onMethodSelected('paypal');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.selectedMethod == 'paypal'
                  ? Colors.blue[800]
                  : const Color(0xFF0498E5),
            ),
            child: Text(
              'PayPal',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton(
            onPressed: () {
              widget.onMethodSelected('card');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.selectedMethod == 'card'
                  ? Colors.blue[800]
                  : const Color(0xFF0498E5),
            ),
            child: Text(
              'Card',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.0),

        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton(
            onPressed: () {
              widget.onMethodSelected('crypto');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.selectedMethod == 'crypto'
                  ? Colors.blue[800]
                  : Color(0xFF0498E5),
            ),
            child: Text(
              'Crypto',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton(
            onPressed: () {
              widget.onMethodSelected('m-pesa');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.selectedMethod == 'm-pesa'
              ? Colors.blue[800]
              : Color(0xFF0498E5)
            ),
            child: Text(
              'M-Pesa',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PaymentsState extends State<Payments> {
  String? selectedPaymentMethod;
  int selectedDays = 1;

  void choosePaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }

  void increaseDays() {
    setState(() {
      selectedDays++;
    });
  }

  void decreaseDays() {
    setState(() {
      if (selectedDays > 1) {
        selectedDays--;
      }
    });
  }

  double get totalPrice => widget.destination.pricePerDay * selectedDays;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F0FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD7F0FD),
        // leading: Icon(Icons.menu),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PaymentOptions(
                  destination: widget.destination,
                  selectedMethod: selectedPaymentMethod,
                  onMethodSelected: choosePaymentMethod,
                  selectedDays: selectedDays,
                  onIncreaseDays: increaseDays,
                  onDecreaseDays: decreaseDays,
                ),

                SizedBox(height: 20),

                if (selectedPaymentMethod != null)
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentDetails(
                              destination: widget.destination,
                              paymentMethod: selectedPaymentMethod!,
                              numberOfDays: selectedDays,
                              // check this with the function total price also
                              totalPrice: totalPrice,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0498E5),
                      ),
                      child: Text(
                        'Continue with ${selectedPaymentMethod!.toUpperCase()}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
