import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edo_ukiyo_map/providers/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedWorkNotifierProvider);
    return Scaffold(
      body: Center(
        child: selected != null
          ? Text(selected.nameJa)
          : Container()
      ),
    );
  }
}
