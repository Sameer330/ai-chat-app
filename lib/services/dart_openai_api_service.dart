import 'package:ai_chat_app/utils/common_vars.dart';
import 'package:dart_openai/openai.dart';

class DartOpenAIAPIService {
  Future<String> dartOpenAIAPIService(String prompt) async {
    try {
      conversationHistory.add(OpenAIChatCompletionChoiceMessageModel(
        content: prompt,
        role: OpenAIChatMessageRole.user,
      ));

      OpenAIChatCompletionModel chatCompletion =
          await OpenAI.instance.chat.create(
        model: "gpt-3.5-turbo",
        messages: conversationHistory,
        n: 1,
      );

      // print(chatCompletion.choices[0].toString());

      conversationHistory.add(
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.assistant,
          content: chatCompletion.choices[0].message.content,
        ),
      );

      return chatCompletion.choices[0].message.content;
    } catch (e) {
      throw "Error: $e";
    }
  }
}
