import 'package:flutter/material.dart';
import 'package:wanderlustventures_app/models/destination.dart';
import 'package:wanderlustventures_app/screens/details.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;
  final Function(bool) onBookmarkChanged;

  const DestinationCard({
    super.key,
    required this.destination,
    required this.onBookmarkChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(destination: destination),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                destination.imagePath,
                fit: BoxFit.fitWidth,
                height: 200,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  destination.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    destination.isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: destination.isBookmarked ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    onBookmarkChanged(!destination.isBookmarked);
                  },
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              destination.description,
              style: TextStyle( fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 8,)
          ],
        ),
      ),
    );
  }
}
