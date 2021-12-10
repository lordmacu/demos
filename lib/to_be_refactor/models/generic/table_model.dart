
import 'dart:convert';

TableModel tableFromJson(String str) => TableModel.fromJson(json.decode(str));

String tableToJson(TableModel data) => json.encode(data.toJson());

class TableModel {
    int id;
    String title;
    String description;

    TableModel({
        this.id,
        this.title,
        this.description,
    });

    factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
    };

 Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = id;
		}
		map['title'] = title;
		map['description'] =description; 

		return map;
	}
  TableModel.fromMapObject(Map<String, dynamic> map) {
		this.id = map['id'];
		this.title = map['title'];
		this.description = map['description'];
	}
}
