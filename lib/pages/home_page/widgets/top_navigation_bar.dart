import 'package:flutter/material.dart';
import 'package:viyukta/pages/info_page/info_page.dart';

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InfoPage(),
                ),
              );
            },
            icon: const Icon(Icons.info_outline),
            iconSize: 28,
          ),
        ],
      ),
    );
  }
}
