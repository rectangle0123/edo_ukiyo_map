import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:edo_ukiyo_map/widgets/commons.dart';

/// デバッグ画面
class DebugPage extends StatelessWidget {

  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Hello!'),
      ),
      child: Center(
        child: Compass(degree: 202.5),
      ),
    );
  }
}
