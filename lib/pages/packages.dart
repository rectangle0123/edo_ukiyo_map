import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:edo_ukiyo_map/pages/lisenses.dart';

/// パッケージ情報
class PackagesPage extends StatefulWidget {
  const PackagesPage({super.key});

  @override
  PackagesPageState createState() => PackagesPageState();
}

class PackagesPageState extends State<PackagesPage> {
  /// パディング
  static const padding = 16.0;
  /// インジケーターの寸法
  static const dimension = 16.0;

  // ライセンス情報
  Map<String, List<String>> packages = {};

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.page_licenses),
      ),
      child: (packages.isEmpty)
        ? const SizedBox.expand(
            child: Center(
              child: CupertinoActivityIndicator(radius: dimension),
            ),
          )
        : Scrollbar(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(padding),
                  child: Column(
                    children: [
                      Text(AppLocalizations.of(context)!.text_page_licenses,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: padding),
                      CupertinoListSection.insetGrouped(
                        margin: EdgeInsets.zero,
                        hasLeading: false,
                        children: packages.entries.map((e) => _ListItem(package: e)).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  @override
  void initState() {
    // ライセンスエントリー情報を取得する
    LicenseRegistry.licenses.listen((entry) {
      // ライセンスエントリー情報を分解してパッケージ名とライセンス情報のマップを作成する
      for (final names in entry.packages.map((e) => e)) {
        for (final name in names.split(',')) {
          packages.putIfAbsent(name.trim(), () => []);
          packages[name]!.add(entry.paragraphs.map((e) => e.text).join('\n'));
        }
      }
      // アルファベット順にソートしてリストを描画する
      setState(() => packages = SplayTreeMap.from(
        packages, (a, b) => a.toLowerCase().compareTo(b.toLowerCase()),
      ));
    });
    super.initState();
  }
}

// リストアイテム
class _ListItem extends StatelessWidget {
  // パッケージ情報
  final MapEntry<String, List<String>> package;

  const _ListItem({required this.package});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      title: Text(package.key),
      additionalInfo: Text('${package.value.length}'),
      trailing: const CupertinoListTileChevron(),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LicensesPage(
            packageName: package.key,
            licenses: package.value,
          ),
        ),
      ),
    );
  }
}
