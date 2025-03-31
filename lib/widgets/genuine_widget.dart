import 'package:flutter/material.dart';

class GenuineBottleWidget extends StatelessWidget {
  const GenuineBottleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black, // Background color
        border: Border.all(color: Colors.transparent), // Blue border
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.star, // Replace with your desired icon
                  color: Colors.amber, // Icon color
                  size: 20, // Icon size
                ),
              ),
            ),
            TextSpan(
              text: 'Genuine Bottle (Unopened)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_drop_down, // Dropdown arrow
                  color: Colors.amber, // Arrow color
                  size: 20, // Arrow size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}