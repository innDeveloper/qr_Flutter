import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImage extends StatelessWidget {
  const QRImage(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arşiv QR code'),
        centerTitle: true,
      ),
      body: Center(
        child: QrImageView(
          data: controller.text,
          size: 220,
          gapless: false,

          // You can include embeddedImageStyle Property if you
          //wanna embed an image from your Asset folder
          embeddedImage: const AssetImage('assets/devs.jpg'),
          embeddedImageStyle: const QrEmbeddedImageStyle(
            size: Size(
              100,
              100,
            ),
          ),
        ),
      ),
    );
  }
}
