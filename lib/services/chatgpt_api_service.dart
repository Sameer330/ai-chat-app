import 'dart:convert';

import 'package:ai_chat_app/utils/chatgpt.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ChatGPTAPIService {
  static Future<Map<String, dynamic>> getChatResponse(String userPrompt) async {
    try {
      var response = await http.post(
        Uri.parse(
          Uri.parse(BASE_URL).toString(),
        ),
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "user",
                "content": userPrompt,
              }
            ],
            "temperature": 0.7
          },
        ),
        headers: {
          'Authorization': 'Bearer $OPENAI_API_KEY',
          'Content-Type': 'application/json',
        },
      );

      var decoded_data = jsonDecode(response.body);

      return decoded_data['choices'][0]['message'];
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error: $e",
        backgroundColor: Colors.red,
      );

      throw "Error: $e";
    }
  }
}
