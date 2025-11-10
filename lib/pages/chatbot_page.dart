import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:layout_example/models/mistral_models.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';
  bool _isLoading = false;

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) {
      return;
    }

    setState(() {
      _isLoading = true;
      _response = '';
    });

    // TODO: Replace with actual API key
    const apiKey = '';
    const url = 'https://api.mistral.ai/v1/chat/completions';

    try {
      final request = MistralChatRequest(
        model: 'mistral-medium-latest',
        messages: [
          Message(role: 'system', content: 'Speak in the tone of Donald Duck'),
          Message(role: 'user', content: _controller.text),
        ],
      );

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        final data = MistralChatResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        setState(() {
          _response = data.choices.first.message.content;
        });
      } else {
        setState(() {
          _response = 'Error: ${response.reasonPhrase}';
        });
      }
    } on Exception catch (e) {
      setState(() {
        _response = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Call Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(_response),
              ),
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: CircularProgressIndicator(),
              ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _isLoading ? null : _sendMessage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
