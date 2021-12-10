import 'dart:convert';

import 'package:ualet/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ualet/to_be_refactor/models/Goals/emojiCategory_model.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';

class EmojiService with ChangeNotifier {
  final Dio _dio = Dio();

  Stream<List<EmojiCategory>> getEmojicategory() async* {
    String _apiEndpoint = getIt<Dio>().options.baseUrl;
    final url = '$_apiEndpoint/User/getEmojicategory';
    final response = await _dio.get(url);
    final urlEmoji = '$_apiEndpoint/User/getEmoji';
    final responseEmoji = await _dio.get(urlEmoji);
    var resEmoji;
    var res;

    if (response.statusCode == 200 && responseEmoji.statusCode == 200) {
      res = response.data["Data"];
      resEmoji = responseEmoji.data["Data"];
    }

    List<EmojiCategory> lst = List<EmojiCategory>();
    List<Emoji> lstEmoji = List<Emoji>();
    Emoji emoji;
    for (var itemEmoji in resEmoji) {
      emoji = Emoji(
          id: itemEmoji["id"],
          emojiName: itemEmoji["emojiName"],
          idEmojiCategory: itemEmoji["idEmojiCategory"]);
      lstEmoji.add(emoji);
    }

    for (var item in res) {
      List categoryEmojis = lstEmoji
          .where((element) => element.idEmojiCategory == item["id"])
          .toList();
      var emojiCategory = EmojiCategory(
          id: item["id"], name: item["name"], emoji: categoryEmojis);
      lst.add(emojiCategory);
    }
    yield lst;
  }
}
