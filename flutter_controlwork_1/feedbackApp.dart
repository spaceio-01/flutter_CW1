import 'package:flutter/material.dart';

class FeedbackApp extends StatelessWidget {
  const FeedbackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedbackPage(),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F5),
      appBar: AppBar(
        title: const Text(
          'Feedback Form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D2D2D),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFD1DC),
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2D2D),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please enter your name below to send us your feedback. We appreciate your opinion!',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 32),
            Expanded(child: FeedbackForm()),
          ],
        ),
      ),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _controller = TextEditingController();

  String name = "";
  bool isSent = false;
  String errorMessage = "";

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          style: const TextStyle(color: Color(0xFF2D2D2D)),
          decoration: InputDecoration(
            labelText: 'Your Name',
            labelStyle: const TextStyle(color: Color(0xFFE07A5F)),
            errorText: errorMessage.isEmpty ? null : errorMessage,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFFFD1DC)),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFFFB6C1)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onChanged: (value) {
            name = value;
          },
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB6C1), 
              foregroundColor: const Color(0xFF2D2D2D),
              textStyle: const TextStyle(
                fontWeight:
                    FontWeight.bold, 
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              if (name.trim().isEmpty) {
                setState(() {
                  errorMessage = "Name cannot be empty!";
                  isSent = false;
                });
              } else {
                setState(() {
                  errorMessage = "";
                  isSent = true;
                });
                _controller.clear();
              }
            },
            child: const Text('Send'),
          ),
        ),
        const SizedBox(height: 24),

        if (isSent)
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFB6C1)),
            ),
            child: Text(
              'Sent! Thank you, $name',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE07A5F),
              ),
            ),
          ),
      ],
    );
  }
}
// TODO Implement this library.