import 'student.dart';
import 'package:http/http.dart' as http;

Future<List<Students>> fetchStudents() async {
  String url = "http://192.168.0.7/details/students.php";
  final response = await http.get(url);
  return studentsFromMap(response.body);
}
