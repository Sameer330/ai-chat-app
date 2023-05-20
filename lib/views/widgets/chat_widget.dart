import 'package:ai_chat_app/utils/colors.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatWidget extends StatefulWidget {
  final String msg;
  final ChatMessageType chatMessageType;
  final ScrollController scrollController;

  const ChatWidget(
      {Key? key,
      required this.msg,
      required this.chatMessageType,
      required this.scrollController})
      : super(key: key);

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  void _scrollDown() {
    widget.scrollController.animateTo(
        widget.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: widget.chatMessageType == ChatMessageType.bot
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: widget.chatMessageType == ChatMessageType.bot
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              /// For Copying input from user
              widget.chatMessageType == ChatMessageType.user
                  ? Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () async {
                          await FlutterClipboard.copy(widget.msg);

                          Fluttertoast.showToast(
                            msg: "Copied!",
                            backgroundColor: Palette.gradient2,
                          );
                        },
                        splashColor: Palette.gradient2,
                        icon: const Icon(
                          Icons.copy_outlined,
                          color: Palette.gradient1,
                        ),
                      ),
                    )
                  : Container(),

              /// For copying response from cloud response
              widget.chatMessageType == ChatMessageType.cloud
                  ? Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        onPressed: () async {
                          await FlutterClipboard.copy(widget.msg);

                          Fluttertoast.showToast(
                            msg: "Copied!",
                            backgroundColor: Palette.gradient2,
                          );
                        },
                        splashColor: Palette.gradient2,
                        icon: const Icon(
                          Icons.copy_outlined,
                          color: Palette.gradient1,
                        ),
                      ),
                    )
                  : Container(),

              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  widget.chatMessageType == ChatMessageType.bot
                      ? 'assets/app-icon/app-icon.png'
                      : widget.chatMessageType == ChatMessageType.user
                          ? 'assets/app-icon/person.png'
                          : 'assets/app-icon/gear.png',
                ),
              ),

              /// For copying response from bot
              widget.chatMessageType == ChatMessageType.bot
                  ? Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        onPressed: () async {
                          await FlutterClipboard.copy(widget.msg);

                          Fluttertoast.showToast(
                            msg: "Copied!",
                            backgroundColor: Palette.gradient2,
                          );
                        },
                        splashColor: Palette.gradient2,
                        icon: const Icon(
                          Icons.copy_outlined,
                          color: Palette.gradient1,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(8.0),
            // width: MediaQuery.of(context).size.width * 0.75,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Palette.borderColor,
                backgroundBlendMode: BlendMode.difference,
                border: Border.all(color: Palette.gradient2)),
            child: widget.chatMessageType == ChatMessageType.bot ||
                    widget.chatMessageType == ChatMessageType.cloud
                ? AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        widget.msg,
                        cursor: '|',
                        textStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                        speed: const Duration(milliseconds: 50),
                        curve: Curves.linear,
                      ),
                    ],
                    repeatForever: false,
                    onFinished: () {
                      _scrollDown();
                    },
                    totalRepeatCount: 0,
                    isRepeatingAnimation: false,
                    // pause: const Duration(milliseconds: 1000),
                    // displayFullTextOnTap: true,
                    // stopPauseOnTap: true,
                  )
                : Text(
                    widget.msg,
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

enum ChatMessageType { user, bot, cloud }

class ChatMessage {
  final String text;
  final ChatMessageType chatMessageType;

  ChatMessage({
    required this.text,
    required this.chatMessageType,
  });
}
