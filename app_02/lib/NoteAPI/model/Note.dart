import 'dart:convert';

class Note {
  int? id;
  String title;
  String content;
  int priority;
  DateTime createdAt;
  DateTime modifiedAt;
  List<String>? tags;
  String? color;
  int userId;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.priority,
    required this.createdAt,
    required this.modifiedAt,
    this.tags,
    this.color,
    required this.userId,
  });

  Map<String, dynamic> toData() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'priority': priority,
      'createdAt': createdAt.toIso8601String(),
      'modifiedAt': modifiedAt.toIso8601String(),
      'tags': tags?.join(','),
      'color': color,
      'userId': userId,
    };
  }

  Map<String, dynamic> toMap() => toData();

  String toJSON() => jsonEncode(toData());

  factory Note.fromMap(Map<String, dynamic> map) {
    DateTime parseDate(String? dateStr) {
      if (dateStr == null || dateStr.isEmpty) return DateTime.now();
      try {
        return DateTime.parse(dateStr);
      } catch (e) {
        return DateTime.now();
      }
    }

    return Note(
      id: map['id'] != null ? int.tryParse(map['id'].toString()) : null,
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      priority: map['priority'] != null ? int.tryParse(map['priority'].toString()) ?? 0 : 0,
      createdAt: parseDate(map['createdAt']),
      modifiedAt: parseDate(map['modifiedAt']),
      tags: map['tags'] != null
          ? (map['tags'] is List
          ? List<String>.from(map['tags'])
          : List<String>.from((map['tags'] as String).split(',')))
          : null,
      color: map['color'] ?? '',
      userId: map['userId'] != null ? int.tryParse(map['userId'].toString()) ?? 0 : 0,
    );
  }

  factory Note.fromJSON(String json) => Note.fromMap(jsonDecode(json));

  Note copyWith({
    int? id,
    String? title,
    String? content,
    int? priority,
    DateTime? createdAt,
    DateTime? modifiedAt,
    List<String>? tags,
    String? color,
    int? userId, // copy userId nếu cần
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      tags: tags ?? this.tags,
      color: color ?? this.color,
      userId: userId ?? this.userId,
    );
  }

  @override
  String toString() {
    return 'Note(id: $id, title: $title, priority: $priority, userId: $userId)';
  }
}
