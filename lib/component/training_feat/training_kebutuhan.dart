import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:talkys/component/training_feat/listening_mode_modal.dart';

class TrainingKebutuhanComponent extends StatefulWidget {
  const TrainingKebutuhanComponent({super.key});

  @override
  _TrainingKebutuhanComponent createState() =>
      _TrainingKebutuhanComponent();
}

class _TrainingKebutuhanComponent extends State<TrainingKebutuhanComponent> {
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
                _buildGridItem("assets/img/makan.png", "MAKAN", "Saya mau makan"),
                _buildGridItem("assets/img/minum.png", "MINUM", "Saya mau minum"),
                _buildGridItem("assets/img/mandi.gif", "MANDI", "Saya mau mandi"),
                _buildGridItem("assets/img/tidur.gif", "TIDUR", "Saya mau tidur"),
                _buildGridItem("assets/img/sholat.gif", "SHOLAT", "Saya mau sholat"),
                _buildGridItem("assets/img/gosok gigi.gif", "GOSOK GIGI", "Saya mau gosok gigi"),
                _buildGridItem("assets/img/minum.png", "CUCI MUKA", "Saya mau mencuci muka"),
                _buildGridItem("assets/img/bermain.gif", "BERMAIN", "Saya mau bermain"),
                _buildGridItem("assets/img/belajar.gif", "BELAJAR", "Saya mau belajar"),
                _buildGridItem("assets/img/buang air kecil.png", "BAK", "Saya mau buang air kecil"),
                _buildGridItem("assets/img/buang air besar.png", "BAB", "Saya mau buang air besar"),
                _buildGridItem("assets/img/sepatu.gif", "SEPATU", "Saya mau memakai sepatu"),
                _buildGridItem("assets/img/sekolah.gif", "SEKOLAH", "Saya mau pergi ke sekolah"),
                _buildGridItem("assets/img/rumah.gif", "PULANG", "Saya mau pulang"),
                _buildGridItem("assets/img/baju.gif", "BAJU", "Saya mau memakai baju"),
                _buildGridItem("assets/img/celana.gif", "CELANA", "Saya mau memakai celana"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(String imagePath, String label, String textToSpeak) {
    return GestureDetector(
      onTap: () => _showCustomDialog(context, textToSpeak),
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

  void _showCustomDialog(BuildContext context, String question) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ListeningModeModal(question: question,);
      },
    );
  }
}
