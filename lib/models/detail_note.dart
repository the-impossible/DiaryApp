import 'dart:convert';
import 'dart:typed_data';

class DetailNote {
  DetailNote({
    required this.id,
    required this.title,
    required this.mood,
    required this.note,
    required this.dateCreated,
    required this.pic,
  });

  int id;
  String title;
  String mood;
  String note;
  DateTime dateCreated;
  Uint8List pic;

  factory DetailNote.fromJson(Map<String, dynamic> json) => DetailNote(
        id: json["id"],
        title: json["title"],
        mood: json["mood"],
        note: json["note"],
        dateCreated: DateTime.parse(json["date_created"]),
        pic: base64Decode(json["pic"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "mood": mood,
        "note": note,
        "date_created": dateCreated.toIso8601String(),
        "pic": base64Encode(pic),
      };
}

DetailNote detailNoteFromJson(String str) =>
    DetailNote.fromJson(json.decode(str));

String detailNoteToJson(DetailNote data) => json.encode(data.toJson());
