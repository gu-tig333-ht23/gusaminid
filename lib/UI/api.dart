import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';
const String APIKEY = '097bb9bb-1dc0-4117-b310-6147aa2932e7';
// get

// class API
Future<List<Todo>> getTodos() async {
  try {
    final response = await http.get(Uri.parse('$ENDPOINT/todos?key=$APIKEY'));
    String body = response.body;
    final List<dynamic> jsonResponse = jsonDecode(body);
    return jsonResponse.map((json) => Todo.fromJson(json)).toList();
  } catch (e) {
    print('Error: $e');
  }
  return [];
}

// post todo
Future<void> postTodo(Todo todo) async {
  await http.post(
    Uri.parse('$ENDPOINT/todos?key=$APIKEY'),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode(todo.toJson()),
  );
}

// put/ update
// and updates title and done for the already existing Todo with id in URL.
Future<void> updateTodoDone(Todo todo) async {
  final Map<String, dynamic> requestBody = {
    'title': todo.title,
    'done': todo.done
  };

  await http.put(
    Uri.parse("$ENDPOINT/todos/${todo.id}?key=$APIKEY"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(requestBody),
  );
}
// delete

Future<void> deleteTodo(String id) async {
  await http.delete(Uri.parse("$ENDPOINT/todos/$id?key=$APIKEY"));
}
