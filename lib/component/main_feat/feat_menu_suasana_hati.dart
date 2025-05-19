import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';

class FeatMenuSuasanaHatiComponent extends StatefulWidget {
  const FeatMenuSuasanaHatiComponent({super.key});

  @override
  _FeatMenuSuasanaHatiComponent createState() =>
      _FeatMenuSuasanaHatiComponent();
}

class _FeatMenuSuasanaHatiComponent extends State<FeatMenuSuasanaHatiComponent> {
  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer _audioPlayer = AudioPlayer();
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

  void _playSound(String fileName) async {
    await _audioPlayer.play(AssetSource(fileName));
  }

  @override
  void dispose() {
    flutterTts.stop();
    _audioPlayer.stop();
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
                _buildGridItem("assets/img/bahagia.gif", "BAHAGIA", "Saya merasa bahagia", "audio/bahagia.mp3"),
                _buildGridItem("assets/img/marah.gif", "MARAH", "Saya merasa marah", "audio/marah.mp3"),
                _buildGridItem("assets/img/sedih.gif", "SEDIH", "Saya merasa sedih", "audio/sedih.mp3"),
                _buildGridItem("assets/img/takut.gif", "TAKUT", "Saya merasa takut", "audio/takut.mp3"),
                _buildGridItem("assets/img/bingung.gif", "BINGUNG", "Saya merasa bingung", "audio/bingung.mp3"),
                _buildGridItem("assets/img/kecewa.gif", "KECEWA", "Saya merasa kecewa", "audio/kecewa.mp3"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(String imagePath, String label, String textToSpeak, String soundFile) {
    return GestureDetector(
      onTap: isSpeaking ? null : () {
        _playSound(soundFile);
        // _speak(textToSpeak);
      },
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
