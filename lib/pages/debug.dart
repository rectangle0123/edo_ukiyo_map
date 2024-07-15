import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// デバッグ画面
class DebugPage extends StatelessWidget {

  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Hello!'),
    //   ),
    //   body: const SizedBox.expand(
    //     child: Center(
    //       child: Text('Hello!'),
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {},
    //     child: const Icon(Icons.add),
    //   ),
    // );
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Hello!'),
      ),
      child: SizedBox.expand(
        child: Column(
          children: [
            const Text('Hello!'),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
