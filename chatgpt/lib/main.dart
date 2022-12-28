import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

Future main() async {
  await dotenv.load();
  String ? apiKey  = await dotenv.env['CHATGPT_API_KEY'];
  // ...
}
Future<String> sendMessage(String message) async {
  final response = await http.post(
    'https://api.chatgpt.com/v1/messages',
    headers: {'Authorization': 'Bearer $apiKey'},
    body: {'text': message},
  );
  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    return responseJson['text'];
  } else {
    throw Exception('Failed to send message');
  }
}


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10, // replace with the number of messages in the chat
            itemBuilder: (context, index) {
              return Text('Message $index'); // replace with the message text
            },
          ),
        ),
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: 'Enter a message',
          ),
        ),
        TextButton(
          onPressed: () {
            // send the message to the ChatGPT API and add it to the chat window
          },
          child: Text('Send'),
        ),
      ],
    );
  }
}
