import 'package:flutter/services.dart' show rootBundle;

/// CSVユーティリティ
class CsvUtils {
  /// CSVを読み込む
  static Future<List<List<String>>> read(String fileName) async {
    var data = await rootBundle.loadString('assets/data/$fileName');
    // 最後に改行があれば削除
    if (data[data.length - 1] == "\n") data = data.substring(0, data.length - 1);
    // 行作成
    return data.split("\n").map((e) {
      // 最初と最後の「"」を削除
      final line = e.substring(1, e.length - 2);
      // 「","」で分割
      return line.split('","');
    }).toList();
  }
}
