import 'dart:convert';

class AllNotes {
    AllNotes({
        required this.id,
        required this.title,
        required this.mood,
        required this.dateCreated,
    });

    int id;
    String title;
    String mood;
    DateTime dateCreated;

    factory AllNotes.fromJson(Map<String, dynamic> json) => AllNotes(
        id: json["id"],
        title: json["title"],
        mood: json["mood"],
        dateCreated: DateTime.parse(json["date_created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "mood": mood,
        "date_created": dateCreated.toIso8601String(),
    };
}


List<AllNotes> allNotesFromJson(String str) => List<AllNotes>.from(json.decode(str).map((x) => AllNotes.fromJson(x)));

String allNotesToJson(List<AllNotes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));