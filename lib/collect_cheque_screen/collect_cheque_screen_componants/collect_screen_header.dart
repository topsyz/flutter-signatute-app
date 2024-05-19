import 'package:flutter/material.dart';

class CollectScreenHeader extends StatelessWidget {
  const CollectScreenHeader({
    super.key,
    this.userName = "helmy helal",
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Good Evening, $userName",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
