import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// ライセンス一覧画面
class LicensesPage extends StatelessWidget {
  /// パディング
  static const padding = 16.0;
  /// 要素間のスペース
  static const space = 32.0;

  /// パッケージ名
  final String packageName;
  /// ライセンス
  final List<String> licenses;

  const LicensesPage({super.key, required this.packageName, required this.licenses});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(packageName, overflow: TextOverflow.ellipsis),
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: SafeArea(
            child: ListView.separated(
              padding: const EdgeInsets.all(padding),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: licenses.length,
              itemBuilder: (context, index) => Text(
                licenses[index],
                style: Theme.of(context).textTheme.bodyMedium
              ),
              separatorBuilder: (context, int index) => const Divider(
                height: space,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
