import 'dart:convert';
import 'package:http/http.dart' as http;

class GroupStorage {
  static const String _baseUrl = 'https://api.jsonbin.io/v3/b/YOUR_BIN_ID';
  static const String _apiKey = 'YOUR_SECRET_KEY';

  /// Loads all groups and returns one by name (or null if not found)
  static Future<Map<String, dynamic>?> loadGroup(String name) async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {"X-Master-Key": _apiKey},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final groups = List<Map<String, dynamic>>.from(data["record"]["groups"]);
      return groups.firstWhere(
            (g) => g["name"] == name,
        orElse: () => {},
      );
    } else {
      throw Exception("Failed to load groups " + response.statusCode.toString());
    }
  }

  /// Saves or updates a group by name
  static Future<void> saveGroup(Map<String, dynamic> groupData) async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {"X-Master-Key": _apiKey},
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to fetch groups before saving");
    }

    final data = jsonDecode(response.body);
    final groups = List<Map<String, dynamic>>.from(data["record"]["groups"]);

    // Update or insert group
    final index = groups.indexWhere((g) => g["name"] == groupData["name"]);
    if (index != -1) {
      groups[index] = groupData;
    } else {
      groups.add(groupData);
    }

    // Upload updated list
    final updateResponse = await http.put(
      Uri.parse(_baseUrl),
      headers: {
        "Content-Type": "application/json",
        "X-Master-Key": _apiKey,
      },
      body: jsonEncode({"groups": groups}),
    );

    if (updateResponse.statusCode != 200) {
      throw Exception("Failed to save group " + updateResponse.statusCode.toString());
    }
  }
}