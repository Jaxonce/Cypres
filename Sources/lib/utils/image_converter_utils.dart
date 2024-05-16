import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

import 'package:flutter/services.dart';

class ImageConverterUtils {
  static Future<String> convertImageToBase64(String url) async {
    ByteData data = await rootBundle.load(url);
    List<int> bytes = data.buffer.asUint8List();
    return base64Encode(Uint8List.fromList(bytes));
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }
}