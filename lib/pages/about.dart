import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// アプリ説明画面
class AboutPage extends StatelessWidget {
  /// パディング
  static const padding = 16.0;
  /// 要素間のスペース
  static const space = 16.0;

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.page_about),
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: padding),
                    child: Text(
                      AppLocalizations.of(context)!.text_welcome_title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  _TextCard(
                    children: [
                      TextSpan(text: '${AppLocalizations.of(context)!.text_welcome_body_01}\n\n'),
                      TextSpan(text: AppLocalizations.of(context)!.text_welcome_body_02),
                      TextSpan(text: AppLocalizations.of(context)!.text_welcome_body_03),
                    ],
                  ),
                  const SizedBox(height: space),
                  Padding(
                    padding: const EdgeInsets.only(left: padding),
                    child: Text(
                      AppLocalizations.of(context)!.text_disclaimer_title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  _TextCard(
                    children: [
                      TextSpan(text: '${AppLocalizations.of(context)!.text_disclaimer_body_01}\n\n'),
                      TextSpan(text: '${AppLocalizations.of(context)!.text_disclaimer_body_02}\n', style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '${AppLocalizations.of(context)!.text_disclaimer_body_03}\n\n'),
                      TextSpan(text: '${AppLocalizations.of(context)!.text_disclaimer_body_04}\n', style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '${AppLocalizations.of(context)!.text_disclaimer_body_05}\n\n'),
                      TextSpan(text: '${AppLocalizations.of(context)!.text_disclaimer_body_06}\n', style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '${AppLocalizations.of(context)!.text_disclaimer_body_07}\n\n'),
                      TextSpan(text: '${AppLocalizations.of(context)!.text_disclaimer_body_08}\n', style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '${AppLocalizations.of(context)!.text_disclaimer_body_09}\n\n'),
                      TextSpan(text: '${AppLocalizations.of(context)!.text_disclaimer_body_10}\n', style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '${AppLocalizations.of(context)!.text_disclaimer_body_11}\n\n'),
                      TextSpan(text: AppLocalizations.of(context)!.text_disclaimer_body_12),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// テキストカード
class _TextCard extends StatelessWidget {
  // 横パディング
  static const paddingHorizontal = 16.0;
  // 縦パディング
  static const paddingVertical = 8.0;
  // 角丸
  static const radius = 12.0;

  // テキスト
  final List<InlineSpan> children;

  const _TextCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: paddingVertical,
        ),
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: children,
          ),
        ),
      ),
    );
  }
}
