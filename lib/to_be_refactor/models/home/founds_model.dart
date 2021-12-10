import 'dart:convert';

GetFounds getFoundsFromJson(String str) => GetFounds.fromJson(json.decode(str));

String getFoundsToJson(GetFounds data) => json.encode(data.toJson());

class GetFounds {
    GetFounds({
        this.result,
        this.message,
        this.data,
    });

    bool result;
    dynamic message;
    Data data;

    factory GetFounds.fromJson(Map<String, dynamic> json) => GetFounds(
        result: json["Result"],
        message: json["Message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "Result": result,
        "Message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.content,
    });

    List<Content> content;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        content: List<Content>.from(json["Content"].map((x) => Content.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Content": List<dynamic>.from(content.map((x) => x.toJson())),
    };
}

class Content {
    Content({
        this.id,
        this.name,
        this.folder,
        this.img,
        this.distribution,
        this.color,
        this.rent,
    });

    int id;
    String name;
    String folder;
    String img;
    String distribution;
    String color;
    List<Rent> rent;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        name: json["name"],
        folder: json["folder"],
        img: json["img"],
        distribution: json["distribution"],
        color: json["color"],
        rent: List<Rent>.from(json["rent"].map((x) => Rent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "folder": folder,
        "img": img,
        "distribution": distribution,
        "color": color,
        "rent": List<dynamic>.from(rent.map((x) => x.toJson())),
    };
}

class Rent {
    Rent({
        this.name,
    });

    String name;

    factory Rent.fromJson(Map<String, dynamic> json) => Rent(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
