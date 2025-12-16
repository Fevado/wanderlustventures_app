import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/screens/payments.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class DetailImages extends StatefulWidget {
  const DetailImages({Key? key}) : super(key: key);

  @override
  _DetailImagesState createState() => _DetailImagesState();
}

class _DetailImagesState extends State<DetailImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/maasai.jpg', fit: BoxFit.fitWidth),
        Row(
          children: [
            Text("Maasai Mara", style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            Icon(Icons.bookmark),
          ],
        ),
        Text(
          'The beautiful Maa culture. Get to interact and learn about the Maa people and their amazing culture.',
        ),
      ],
    );
  }
}

class DetailDescription extends StatefulWidget {
  const DetailDescription({Key? key}) : super(key: key);

  @override
  _DetailDescriptionState createState() => _DetailDescriptionState();
}

class _DetailDescriptionState extends State<DetailDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.location_on),
            Text('Narok, Kenya'),
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
            Text('\$196 per day'),
          ],
        ),
        Text(
          'Tourists are expected to lias with their guides for accomodation or find one of their liking',
        ),
      ],
    );
  }
}

class DetailButton extends StatefulWidget {
  const DetailButton({Key? key}) : super(key: key);

  @override
  _DetailButtonState createState() => _DetailButtonState();
}

class _DetailButtonState extends State<DetailButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Payments()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0498E5),
          ),
          child: Text(
            'Book trip',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F0FD),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: const Color(0xFFD7F0FD),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const DetailImages(), 
                SizedBox(height: 16.0),
                const DetailDescription(),
                SizedBox(height: 16.0,),
                const DetailButton()], 
            ),
          ),
        ),
      ),
    );
  }
}
