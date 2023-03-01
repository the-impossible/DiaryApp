import 'dart:convert';

class AllMoods {
    AllMoods({
        required this.id,
        required this.mood,
    });

    int id;
    String mood;

    factory AllMoods.fromJson(Map<String, dynamic> json) => AllMoods(
        id: json["id"],
        mood: json["mood"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mood": mood,
    };
}

List<AllMoods> allMoodsFromJson(String str) => List<AllMoods>.from(json.decode(str).map((x) => AllMoods.fromJson(x)));

String allMoodsToJson(List<AllMoods> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));