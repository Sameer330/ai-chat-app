import 'package:ai_chat_app/services/chatgpt_api_service.dart';
import 'package:ai_chat_app/services/dart_openai_api_service.dart';
import 'package:ai_chat_app/services/minor_project_api_service.dart';
import 'package:ai_chat_app/utils/colors.dart';
import 'package:ai_chat_app/utils/common_vars.dart';
import 'package:ai_chat_app/views/menu_page.dart';
import 'package:ai_chat_app/views/widgets/chat_widget.dart';
import 'package:ai_chat_app/views/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final user = FirebaseAuth.instance.currentUser;
  final TextEditingController _userPromptController = TextEditingController();
  bool _isTyping = true;
  final ScrollController _scrollController = ScrollController();

  List<ChatMessage> _conversation = [];

  void _scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mind Reader",
          textScaleFactor: 1.0,
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
        elevation: 2,
        centerTitle: true,
        backgroundColor: Palette.backgroundColor,
        leadingWidth: 40,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MenuPage(),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 2),
            child: Image.asset(
              'assets/app-icon/app-icon.png',
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              // fixedSize: Size(MediaQuery.of(context).size.width * 0.93, 55),
              backgroundColor: Palette.backgroundColor,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/app-icon/person.png',
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        left: true,
        right: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _conversation.isEmpty
                ? Flexible(
                    child: Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Lottie.asset(
                              'assets/lottie/bott.json',
                              animate: true,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ),
                            Text(
                              "Initiate a conversation by sending me your prompt",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Flexible(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _scrollController,
                      itemCount: _conversation.length,
                      itemBuilder: (context, index) {
                        return ChatWidget(
                          msg: _conversation[index].text,
                          chatMessageType: _conversation[index].chatMessageType,
                          scrollController: _scrollController,
                        );
                      },
                    ),
                  ),
            if (_isTyping) ...[
              // const SpinKitThreeBounce(
              //   color: Palette.gradient2,
              //   size: 20,
              // ),
              const SizedBox(
                height: 10,
              ),
              !_isTyping
                  ? Expanded(
                      child: Container(
                        // margin: const EdgeInsets.only(right: 10),
                        width: 20,
                        child: const SpinKitThreeBounce(
                          color: Palette.gradient2,
                          size: 20,
                        ),
                      ),
                    )
                  : Container(),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin:
                          const EdgeInsets.only(bottom: 3, left: 5, right: 5),
                      padding:
                          const EdgeInsets.only(left: 2, right: 2, bottom: 2),
                      width: MediaQuery.of(context).size.width * 0.8,
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.width * 0.3),
                      child: _isTyping
                          ? TextFormField(
                              controller: _userPromptController,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              maxLines: null,
                              // enabled: _isTyping,
                              readOnly: !_isTyping,
                              decoration: InputDecoration(
                                errorMaxLines: 5,
                                hintText: "Enter prompt here",
                                contentPadding: const EdgeInsets.all(27),
                                disabledBorder: InputBorder.none,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Palette.gradient1,
                                    width: 4,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Palette.borderColor,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Palette.gradient1,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                hintStyle: GoogleFonts.montserrat(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SpinKitThreeBounce(
                              color: Palette.gradient2,
                              size: 20,
                            ),
                    ),
                  ),

                  /// Send + loading
                  _isTyping
                      ? Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () async {
                              FocusScope.of(context).unfocus();

                              if (useGPTwithoutContext == false &&
                                  useGPTwithContext == false &&
                                  useGPTwithContextandCloud == false) {
                                setState(() {
                                  useGPTwithoutContext = true;
                                });
                                Fluttertoast.showToast(
                                  msg:
                                      "No Mode was Selected! Entering Normal Mode!",
                                  backgroundColor: Colors.red,
                                );
                              }

                              /// Normal Mode
                              if (useGPTwithoutContext) {
                                if (_userPromptController.text.trim().isEmpty) {
                                  Fluttertoast.showToast(
                                    msg: "Prompt cannot be empty!",
                                    backgroundColor: Colors.red,
                                  );
                                } else if (_userPromptController.text.trim() ==
                                    "/clear") {
                                  Fluttertoast.showToast(
                                    msg: "Cleared your conversation!",
                                    backgroundColor: Colors.green,
                                  );
                                  setState(() {
                                    _conversation.clear();
                                    _userPromptController.clear();
                                  });
                                } else {
                                  var _userInput =
                                      _userPromptController.text.trim();

                                  /// Display user input
                                  setState(() {
                                    _conversation.add(
                                      ChatMessage(
                                        text: _userInput,
                                        chatMessageType: ChatMessageType.user,
                                      ),
                                    );
                                    _isTyping = false;
                                  });

                                  _userPromptController.clear();
                                  Future.delayed(
                                          const Duration(microseconds: 50))
                                      .then((value) => null);

                                  /// Call ChatGPT API
                                  Map<String, dynamic> _botResponse =
                                      await ChatGPTAPIService.getChatResponse(
                                          _userInput);

                                  // String _botResponse =
                                  //     await MinorProjectAPIService()
                                  //         .minorProjectAPIService(
                                  //             _userPromptController.text.trim());

                                  setState(() {
                                    _conversation.add(
                                      ChatMessage(
                                        text: _botResponse['content'],
                                        // For directly using ChatGPT
                                        // text: _botResponse, // For using through Azure
                                        chatMessageType: ChatMessageType.bot,
                                      ),
                                    );
                                  });

                                  _userPromptController.clear();

                                  Future.delayed(
                                          const Duration(milliseconds: 50))
                                      .then((value) {
                                    _scrollDown();
                                    setState(() {
                                      _isTyping = true;
                                    });
                                  });

                                  /// Display Response
                                }
                              }

                              /// Context Mode
                              if (useGPTwithContext) {
                                if (_userPromptController.text.trim().isEmpty) {
                                  Fluttertoast.showToast(
                                    msg: "Prompt cannot be empty!",
                                    backgroundColor: Colors.red,
                                  );
                                } else if (_userPromptController.text.trim() ==
                                    "/clear") {
                                  Fluttertoast.showToast(
                                    msg: "Cleared your conversation!",
                                    backgroundColor: Colors.green,
                                  );
                                  setState(() {
                                    _conversation.clear();
                                    conversationHistory.clear();
                                    _userPromptController.clear();
                                  });
                                } else {
                                  var _userInput =
                                      _userPromptController.text.trim();

                                  /// Display user input
                                  setState(() {
                                    _conversation.add(
                                      ChatMessage(
                                        text: _userInput,
                                        chatMessageType: ChatMessageType.user,
                                      ),
                                    );
                                    _isTyping = false;
                                  });

                                  _userPromptController.clear();
                                  Future.delayed(
                                          const Duration(microseconds: 50))
                                      .then((value) => null);

                                  /// Call ChatGPT API
                                  String _botResponse =
                                      await DartOpenAIAPIService()
                                          .dartOpenAIAPIService(_userInput);

                                  setState(() {
                                    _conversation.add(
                                      ChatMessage(
                                        text: _botResponse,
                                        chatMessageType: ChatMessageType.bot,
                                      ),
                                    );
                                  });

                                  _userPromptController.clear();

                                  Future.delayed(
                                          const Duration(milliseconds: 50))
                                      .then((value) {
                                    _scrollDown();
                                    setState(() {
                                      _isTyping = true;
                                    });
                                  });

                                  /// Display Response
                                }
                              }

                              /// Taxonomy Mode
                              if (useGPTwithContextandCloud) {
                                if (_userPromptController.text.trim().isEmpty) {
                                  Fluttertoast.showToast(
                                    msg: "Prompt cannot be empty!",
                                    backgroundColor: Colors.red,
                                  );
                                } else if (_userPromptController.text.trim() ==
                                    "/clear") {
                                  Fluttertoast.showToast(
                                    msg: "Cleared your conversation!",
                                    backgroundColor: Colors.green,
                                  );
                                  setState(() {
                                    _conversation.clear();
                                    conversationHistory.clear();
                                    _userPromptController.clear();
                                  });
                                } else {
                                  var _userInput =
                                      _userPromptController.text.trim();

                                  /// Display user input
                                  setState(() {
                                    _conversation.add(
                                      ChatMessage(
                                        text: _userInput,
                                        chatMessageType: ChatMessageType.user,
                                      ),
                                    );
                                    _isTyping = false;
                                  });

                                  _userPromptController.clear();
                                  Future.delayed(
                                          const Duration(microseconds: 50))
                                      .then((value) => null);

                                  _userPromptController.clear();

                                  /// Call ChatGPT API
                                  String _botResponse =
                                      await DartOpenAIAPIService()
                                          .dartOpenAIAPIService(_userInput);

                                  setState(() {
                                    _conversation.add(
                                      ChatMessage(
                                        text: _botResponse,
                                        chatMessageType: ChatMessageType.bot,
                                      ),
                                    );
                                  });

                                  final cloudResponse =
                                      await MinorProjectAPIService()
                                          .minorProjectAPIService(
                                              _userInput, _botResponse);

                                  String _botResponse2 =
                                      await DartOpenAIAPIService()
                                          .dartOpenAIAPIService(cloudResponse);

                                  setState(() {
                                    _conversation.add(
                                      ChatMessage(
                                        text: _botResponse2,
                                        chatMessageType: ChatMessageType.bot,
                                      ),
                                    );
                                  });

                                  Future.delayed(
                                          const Duration(milliseconds: 50))
                                      .then((value) {
                                    _scrollDown();
                                    setState(() {
                                      _isTyping = true;
                                    });
                                  });

                                  /// Display Response
                                }
                              }
                            },
                            child: Container(
                              child: Image.asset(
                                'assets/app-icon/send.png',
                                width: 45,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          // margin: const EdgeInsets.only(right: 10),
                          width: 20,
                          child: const SpinKitThreeBounce(
                            color: Palette.gradient2,
                            size: 20,
                          ),
                        ),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
