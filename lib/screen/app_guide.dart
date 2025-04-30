import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AppGuidePage extends StatelessWidget {
  AppGuidePage({super.key});

  final List<Map<String, String>> images = [
    {'image': 'assets/img/guide/Guide01.jpeg', 'caption': 'Ini adalah tampilan awal, klik mulai untuk masuk ke aplikasi'},
    {'image': 'assets/img/guide/Guide02.jpeg', 'caption': 'Masukkan nama kamu'},
    {'image': 'assets/img/guide/Guide03.jpeg', 'caption': 'Setelah klik masuk, kamu akan dialihkan ke fitur utama aplikasi'},
    {'image': 'assets/img/guide/Guide04.jpeg', 'caption': 'Klik tombol "Kamu mau apa?" untuk memunculkan hal yang ingin kamu sampaikan'},
    {'image': 'assets/img/guide/Guide05.jpeg', 'caption': 'Pilih salah satu opsi'},
    {'image': 'assets/img/guide/Guide06.jpeg', 'caption': 'Berikut tampilan untuk menu kebutuhan, tekan diarea atas untuk kembali ke pilihan sebelumnya'},
    {'image': 'assets/img/guide/Guide07.jpeg', 'caption': 'Berikut tampilan untuk menu suasana hati, tekan diarea atas untuk kembali ke pilihan sebelumnya'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Carousel Slider
          Positioned.fill(
            child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                return Stack(
                  children: [
                    // Gambar mengambil seluruh ukuran layar
                    Positioned.fill(
                      child: Image.asset(
                        images[index]['image']!,
                        fit: BoxFit.cover, // Gambar penuh
                      ),
                    ),
                    // Caption berada di bawah gambar (sekitar 80% ke bawah layar)
                    Positioned(
                      bottom:
                          MediaQuery.of(context).size.height *
                          0.2, // Posisikan caption 80% ke bawah
                      left: 20.0,
                      right: 20.0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.black.withOpacity(
                          0.6,
                        ), // Background semi-transparan
                        child: Text(
                          images[index]['caption']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height, // Fullscreen height
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 1.0,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: Text(
                'Cara Pakai',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              backgroundColor: Color(0x99FFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}
