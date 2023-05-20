import 'dart:convert';

import 'package:ai_chat_app/utils/chatgpt.dart';
import 'package:chatgpt_client/chatgpt_client.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ChatGPTClientAPIService {
  static Future<Map<String, dynamic>> getChatResponse(String userPrompt) async {
    try {
      final client =
          ChatGPTClient(apiKey: OPENAI_API_KEY, model: "gpt-3.5-turbo");

      var text = "";
      final stream = client.sendMessageStream(userPrompt);
      await for (final textChunk in stream) {
        text += textChunk;
        print("1--$textChunk");
      }
      print("2--$text");

      return {};
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error: $e",
        backgroundColor: Colors.red,
      );

      throw "Error: $e";
    }
  }
}
