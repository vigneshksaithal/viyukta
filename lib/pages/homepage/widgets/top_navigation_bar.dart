import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Viyukta'),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
            iconSize: 28,
          ),
        ],
      ),
    );
  }
}
