import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/screens/details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Explore',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.location_on),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search for a destination',
                ),
              ),
            ),
            Icon(Icons.search_sharp),
          ],
        ),
      ],
    );
  }
}

class HomeDetail extends StatefulWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Image.asset('assets/images/nairobi.jpg', fit: BoxFit.fitWidth),
            Row(
              children: [
                Text('Nairobi', style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(Icons.bookmark),
              ],
            ),
            Text(
              'A city of clean waters. Explore the vast surprises the beautiful city has to offer.',
            ),
          ],
        ),
        SizedBox(height: 15),
        Column(
          children: [
            Image.asset('assets/images/maasai.jpg', fit: BoxFit.fitWidth),
            Row(
              children: [
                Text(
                  'Maasai Mara',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.bookmark),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details(),
                  ),
                );
              },
              child:  Text(
          'The beautiful Maa culture. Get to interact and learn about the Maa people and their amazing culture.',
        ),
            ),
          ],
        ),
      ],
    );
  }
}

class _HomeState extends State<Home> {
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
                const Search(),
                SizedBox(height: 15),
                const HomeDetail(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
