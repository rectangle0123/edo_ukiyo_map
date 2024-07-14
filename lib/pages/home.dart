import 'package:flutter/material.dart';

import 'package:edo_ukiyo_map/widgets/menu.dart';
import 'package:edo_ukiyo_map/widgets/map.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Menu(),
      body: Stack(
        children: [
          AppMap(),
          SafeArea(
            child: MenuButton(),
          ),
        ],
      ),
    );
  }
}
