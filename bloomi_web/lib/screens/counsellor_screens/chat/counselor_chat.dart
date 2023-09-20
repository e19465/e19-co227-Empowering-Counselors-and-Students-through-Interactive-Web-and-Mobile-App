import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/screens/home_screens/chat/conversation/conversation.dart';

import 'package:flutter/material.dart';

class CounselorChat extends StatefulWidget {
  const CounselorChat({super.key});

  @override
  State<CounselorChat> createState() => _CounselorChatState();
}

class _CounselorChatState extends State<CounselorChat> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: const Conversation(),
    );
  }
}