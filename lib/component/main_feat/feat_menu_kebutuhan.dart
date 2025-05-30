import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';

class FeatMenuKebutuhanComponent extends StatefulWidget {
  const FeatMenuKebutuhanComponent({super.key});

  @override
  _FeatMenuKebutuhanComponent createState() => _FeatMenuKebutuhanComponent();
}

class _FeatMenuKebutuhanComponent extends State<FeatMenuKebutuhanComponent> {
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

  // Fungsi untuk memutar file MP3 lokal
  void _playSound(String assetPath) async {
    await _audioPlayer.play(AssetSource(assetPath));
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
                _buildGridItem("assets/img/makan.png", "MAKAN", "Saya mau makan", "audio/makan.mp3"),
                _buildGridItem("assets/img/minum.png", "MINUM", "Saya mau minum", "audio/minum.mp3"),
                _buildGridItem("assets/img/mandi.gif", "MANDI", "Saya mau mandi", "audio/mandi.mp3"),
                _buildGridItem("assets/img/tidur.gif", "TIDUR", "Saya mau tidur", "audio/tidur.mp3"),
                _buildGridItem("assets/img/sholat.gif", "SHOLAT", "Saya mau sholat", "audio/sholat.mp3"),
                _buildGridItem("assets/img/gosok gigi.gif", "GOSOK GIGI", "Saya mau gosok gigi", "audio/gosokgigi.mp3"),
                _buildGridItem("assets/img/cuci_muka.gif", "CUCI MUKA", "Saya mau mencuci muka", "audio/cucimuka.mp3"),
                _buildGridItem("assets/img/bermain.gif", "BERMAIN", "Saya mau bermain", "audio/bermain.mp3"),
                _buildGridItem("assets/img/belajar.gif", "BELAJAR", "Saya mau belajar", "audio/belajar.mp3"),
                _buildGridItem("assets/img/buang air kecil.png", "BAK", "Saya mau buang air kecil", "audio/buak.mp3"),
                _buildGridItem("assets/img/buang air besar.png", "BAB", "Saya mau buang air besar", "audio/bab.mp3"),
                _buildGridItem("assets/img/sepatu.gif", "SEPATU", "Saya mau memakai sepatu", "audio/sepatu.mp3"),
                _buildGridItem("assets/img/sekolah.gif", "SEKOLAH", "Saya mau pergi ke sekolah", "audio/sekolah.mp3"),
                _buildGridItem("assets/img/rumah.gif", "PULANG", "Saya mau pulang", "audio/pulang.mp3"),
                _buildGridItem("assets/img/baju.gif", "BAJU", "Saya mau memakai baju", "audio/baju.mp3"),
                _buildGridItem("assets/img/celana.gif", "CELANA", "Saya mau memakai celana", "audio/celana.mp3"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(String imagePath, String label, String textToSpeak, String soundPath) {
    return GestureDetector(
      onTap: isSpeaking ? null : () {
        _playSound(soundPath);
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
