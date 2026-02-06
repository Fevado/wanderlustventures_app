import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/data/destination_data.dart';
import 'package:wanderlustventures_app/models/destination_card.dart';
import 'package:wanderlustventures_app/models/destination.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class Search extends StatefulWidget {
  final Function(String) onSearchChanged;
  const Search({super.key, required this.onSearchChanged});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      widget.onSearchChanged(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
                controller: _searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search for a destination',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search_sharp),
              onPressed: () {
                // TODO: ADD SEARCH LOGIC/USE LISTENER ABOVE
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _HomeState extends State<Home> {
  late List<Destination> _allDestinations;
  List<Destination> _filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    _allDestinations = destinations;
    _filteredDestinations = destinations;
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredDestinations = _allDestinations;
      } else {
        _filteredDestinations = _allDestinations.where((destination) {
          return destination.name.toLowerCase().contains(query.toLowerCase()) ||
              destination.description.toLowerCase().contains(
                query.toLowerCase(),
              );
        }).toList();
      }
    });
  }

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
          child: Column(
            children: [
              Search(
                onSearchChanged: _onSearchChanged,
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredDestinations.length,
                  itemBuilder: (context, index) {
                    return DestinationCard(
                      destination: _filteredDestinations[index],
                      onBookmarkChanged: (isBookmarked) {
                        setState(() {
                          _filteredDestinations[index].isBookmarked = isBookmarked;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
