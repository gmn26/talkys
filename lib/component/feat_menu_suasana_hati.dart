import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FeatMenuSuasanaHatiComponent extends StatefulWidget {
  const FeatMenuSuasanaHatiComponent({super.key});

  @override
  _FeatMenuSuasanaHatiComponent createState() =>
      _FeatMenuSuasanaHatiComponent();
}

class _FeatMenuSuasanaHatiComponent extends State<FeatMenuSuasanaHatiComponent> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController _textController = TextEditingController();
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("id-ID");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);

    flutterTts.setStartHandler(() {
      setState(() {
        isSpeaking = true;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        isSpeaking = false;
      });
      debugPrint("TTS Error: $msg");
    });
  }

  Future<void> _speak(String text) async {
    if (text.isNotEmpty) {
      await flutterTts.stop();
      await flutterTts.speak(text);
    }
  }

  // Future<void> _stop() async {
  //   await flutterTts.stop();
  // }

  @override
  void dispose() {
    flutterTts.stop();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              children: [
                _buildGridItem("assets/img/bahagia.gif", "BAHAGIA", "Saya merasa bahagia"),
                _buildGridItem("assets/img/marah.gif", "MARAH", "Saya merasa marah"),
                _buildGridItem("assets/img/sedih.gif", "SEDIH", "Saya merasa sedih"),
                _buildGridItem("assets/img/takut.gif", "TAKUT", "Saya merasa takut"),
                _buildGridItem("assets/img/bingung.gif", "BINGUNG", "Saya merasa bingung"),
                _buildGridItem("assets/img/kecewa.gif", "KECEWA", "Saya merasa kecewa"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(String imagePath, String label, String textToSpeak) {
    return GestureDetector(
      onTap: isSpeaking ? null : () => _speak(textToSpeak),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          borderRadius: BorderRadius.circular(24.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              label,
              style: const TextStyle(fontSize: 10.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
