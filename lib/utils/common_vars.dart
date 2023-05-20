import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final List<OpenAIChatCompletionChoiceMessageModel> conversationHistory = [];

bool useGPTwithoutContext = true;

bool useGPTwithContext = false;

bool useGPTwithContextandCloud = false;
