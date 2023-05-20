/// This file is only for CHatGPT related functionalities
import 'package:dart_openai/openai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String BASE_URL = "https://api.openai.com/v1/chat/completions";

String OPENAI_API_KEY = dotenv.env['OPENAI_API_KEY']!;

Map<String, String> headers = {
  "Content-Type": "application/json",
  "Accept": "*/*",
  "Accept-Encoding": "gzip, deflate, br",
  "Connection": "keep-alive",
  "Access-Control-Allow-Origin": "*",
  "Authorization": "Bearer $OPENAI_API_KEY",
};
