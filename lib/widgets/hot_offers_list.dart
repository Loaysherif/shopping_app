import 'package:flutter/material.dart';

class HotOffersList extends StatelessWidget {
  const HotOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    // Fixed height for the horizontal list view of offers
    return SizedBox(
      height: 155,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/phone.jpg",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text("Image not found"));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("Offer ${index + 1}"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
