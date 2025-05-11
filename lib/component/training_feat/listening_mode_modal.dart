import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ListeningModeModal extends StatefulWidget {
  const ListeningModeModal({super.key, required this.question});
  final String question;

  @override
  State<ListeningModeModal> createState() => _ListeningModeModalState();
}

class _ListeningModeModalState extends State<ListeningModeModal> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _textGuide = 'Tekan untuk mulai..';
  String _spokenText = '';
  double _confidence = 1.0;

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('Status: $val'),
        onError: (val) => print('Error: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _spokenText = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
            if (_spokenText.toLowerCase() == widget.question.toLowerCase()) {
              _textGuide = "Kamu benar!";
            } else {
              _textGuide = "Oow, kurang tepat";
            }
          }),
          partialResults: true,
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double baseFontSize = size.width * 0.05; // Adjust base font size
    final double micSize = size.width * 0.2; // Responsive mic size

    return Dialog(
      backgroundColor: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.5,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Ucapkan",
                    style: TextStyle(fontSize: baseFontSize * 0.9),
                  ),
                  Text(
                    "\"${widget.question}\"",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: baseFontSize * 1.5),
                  ),
                ],
              ),
              Text(
                _spokenText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: baseFontSize * 1.2),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _textGuide,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: baseFontSize * 1.2),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: micSize,
                    height: micSize,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: GlowButton(
                      color: Colors.white,
                      glowColor: _isListening ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(micSize / 2),
                      child: Icon(Icons.mic, size: micSize * 0.7),
                      onPressed: () {
                        setState(() {
                          _spokenText = "Kamu mengucapkan..";
                          _textGuide = "Mulai berbicara..";
                        });
                        _listen();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
