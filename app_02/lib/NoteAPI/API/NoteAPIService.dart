import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_02/NoteAPI/model/Note.dart';

class NoteAPIService {
  static final NoteAPIService instance = NoteAPIService._init();
  final String baseUrl = 'http://172.21.1.182/notes_db';

  NoteAPIService._init();

  // Tạo mới ghi chú
  Future<Note> createNote(Note note) async {
    final response = await http.post(
      Uri.parse('$baseUrl/notes.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(note.toMap()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.body.isNotEmpty) {
        try {
          final data = jsonDecode(response.body);
          return Note.fromMap(data);
        } catch (e) {
          throw Exception('Dữ liệu phản hồi không hợp lệ khi tạo ghi chú: ${e.toString()}');
        }
      } else {
        throw Exception('Máy chủ không trả về dữ liệu khi tạo ghi chú');
      }
    } else {
      throw Exception('Tạo ghi chú thất bại với mã trạng thái: ${response.statusCode} - ${response.body}');
    }
  }

  Future<List<Note>> getAllNotes() async {
    final response = await http.get(Uri.parse('$baseUrl/notes.php'));

    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        return List<Note>.from(data.map((e) => Note.fromMap(e)));
      } catch (e) {
        throw Exception('Dữ liệu danh sách ghi chú không hợp lệ: ${e.toString()}');
      }
    } else {
      throw Exception('Tải ghi chú thất bại với mã trạng thái: ${response.statusCode}');
    }
  }

  Future<List<Note>> getNotesByUser(int userId) async {
    final allNotes = await getAllNotes();
    return allNotes.where((note) => note.userId == userId).toList();
  }

  Future<Note?> getNoteById(int id) async {
    final notes = await getAllNotes();
    try {
      return notes.firstWhere((n) => n.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<Note> updateNote(Note note) async {
    final response = await http.post(
      Uri.parse('$baseUrl/notes.php?id=${note.id}&_method=PUT'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(note.toMap()),
    );

    print('Phản hồi khi cập nhật: ${response.body}');

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        try {
          return Note.fromMap(jsonDecode(response.body));
        } catch (e) {
          throw Exception('Không thể phân tích dữ liệu cập nhật: ${e.toString()}\nDữ liệu: ${response.body}');
        }
      } else {
        throw Exception('Server không phản hồi sau thao tác cập nhật');
      }
    } else {
      throw Exception('Thao tác cập nhật bị từ chối: ${response.statusCode} - ${response.body}');
    }
  }

  Future<bool> deleteNote(int id) async {
    final response = await http.post(
      Uri.parse('$baseUrl/notes.php?id=$id&_method=DELETE'),
    );
    return response.statusCode == 200 || response.statusCode == 204;
  }

  Future<List<Note>> searchNotes(String keyword, {int? userId}) async {
    final allNotes = await getAllNotes();
    return allNotes.where((note) {
      final matchesKeyword = note.title.toLowerCase().contains(keyword.toLowerCase()) ||
          note.content.toLowerCase().contains(keyword.toLowerCase());
      final matchesUser = userId == null || note.userId == userId;
      return matchesKeyword && matchesUser;
    }).toList();
  }
}
