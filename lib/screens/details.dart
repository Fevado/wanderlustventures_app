import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/models/destination.dart';
import 'package:wanderlustventures_app/screens/payments.dart';

class Details extends StatefulWidget {
  final Destination destination;
  const Details({super.key, required this.destination});

  @override
  State<Details> createState() => _DetailsState();
}

class DetailImages extends StatelessWidget {
  final Destination destination;
  final VoidCallback onBookmarkPressed;
  const DetailImages({
    super.key,
    required this.destination,
    required this.onBookmarkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(destination.imagePath, fit: BoxFit.fitWidth),
        Row(
          children: [
            Text(
              destination.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                destination.isBookmarked
                    ? Icons.bookmark
                    : Icons.bookmark_border,
              ),
              onPressed: onBookmarkPressed,
            ),
          ],
        ),
        Text(destination.description),
      ],
    );
  }
}

class DetailDescription extends StatelessWidget {
  final Destination destination;
  const DetailDescription({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.location_on),
            Text(destination.location),
            Spacer(),
            Icon(Icons.tour_rounded),
            Text('Guide provided'),
          ],
        ),
        Row(
          children: [
            Icon(Icons.car_rental),
            Text('Vehicle Included'),
            Spacer(),
            Icon(Icons.money),
            Text('\$${destination.pricePerDay}'),
          ],
        ),
        Text(
          'Tourists are expected to lias with their guides for accomodation or find one of their liking',
        ),
      ],
    );
  }
}

class _DetailsState extends State<Details> {
  void _toggleBookmark() {
    setState(() {
      widget.destination.isBookmarked = !widget.destination.isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F0FD),
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        backgroundColor: const Color(0xFFD7F0FD),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                DetailImages(destination: widget.destination, onBookmarkPressed: _toggleBookmark,),
                SizedBox(height: 16),
                DetailDescription(destination: widget.destination),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(16, 8, 16, 24),
        child: SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Payments( destination: widget.destination,)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0498E5),
            ),
            child: Text(
              'Book trip',
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
