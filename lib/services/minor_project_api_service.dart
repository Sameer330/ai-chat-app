import 'package:http/http.dart' as http;
import 'dart:convert';

class MinorProjectAPIService {
  Future<String> minorProjectAPIService(String prompt, String solution) async {
    // Map<String, dynamic>
    try {
      final response = await http.post(
        Uri.parse('https://taxonomy-predictions.azurewebsites.net'),
        body: jsonEncode({'query': prompt, "solution": solution}),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
        },
      );

      final responseData = jsonDecode(response.body);
      final cloudResponse = responseData['prompt'];

      return cloudResponse;
    } catch (e) {
      throw "Error: $e";
    }
  }
}
