 
import 'dart:convert';
 
 

List<EmojiCategory> emojiCategoryFromJson(String str) => List<EmojiCategory>.from(json.decode(str).map((x) => EmojiCategory.fromJson(x)));

String emojiCategoryToJson(List<EmojiCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

 
class EmojiCategory {
    EmojiCategory({
        this.id,
        this.name,
        this.emoji,
    });

    int id;
    String name;
    List<Emoji> emoji;

    factory EmojiCategory.fromJson(Map<String, dynamic> json) => EmojiCategory(
        id: json["id"],
        name: json["name"],
        emoji: List<Emoji>.from(json["emoji"].map((x) => Emoji.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "emoji": List<dynamic>.from(emoji.map((x) => x.toJson())),
    };
}

class Emoji {
    Emoji({
        this.id,
        this.idEmojiCategory,
        this.emojiName,
    });

    int id;
    int idEmojiCategory;
    String emojiName;

    factory Emoji.fromJson(Map<String, dynamic> json) => Emoji(
        id: json["id"],
        idEmojiCategory: json["idEmojiCategory"],
        emojiName: json["emojiName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idEmojiCategory": idEmojiCategory,
        "emojiName": emojiName,
    };
}
