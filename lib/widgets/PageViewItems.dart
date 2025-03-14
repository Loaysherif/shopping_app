import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/custom_text.dart';

class PageViewItems extends StatelessWidget {
  final String imgUrl, phoneModel;

  const PageViewItems({
    super.key,
    required this.imgUrl,
    required this.phoneModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          CustomText(
            text: phoneModel,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Text("Image not found"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
