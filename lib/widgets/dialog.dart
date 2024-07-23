import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:edo_ukiyo_map/widgets/commons.dart';
import 'package:edo_ukiyo_map/utils/constants.dart';

/// ヘルプダイアログ
class HelpDialog extends StatelessWidget {
  /// 画面に対する高さの比率
  static const heightRatio = 0.6;
  /// マージン
  static const margin = 16.0;
  /// パティング
  static const padding = 8.0;
  /// 角丸
  static const radius = 16.0;
  /// ヘッダーの高さ
  static const headerHeight = 52.0;
  /// ボタンの寸法
  static const buttonDimension = 32.0;

  const HelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: margin),
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      children: [
        Stack(
          children: [
            SizedBox(
              height: headerHeight,
              width: double.infinity,
              child: Image.asset('assets/images/kiriezu.png', fit: BoxFit.fitWidth),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(padding),
              child: CircleButton(
                dimension: buttonDimension,
                onPressed: () => Navigator.of(context).pop(),
                child: const Icon(Icons.close),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * heightRatio,
          child: _WebView(),
        ),
        const SizedBox(height: padding),
      ],
    );
  }
}

// WebView
class _WebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final url = Localizations.localeOf(context).languageCode == 'ja' ? urlHelpJa : urlHelpEn;

    return WebViewWidget(controller: WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..loadRequest(Uri.parse(url)));
  }
}