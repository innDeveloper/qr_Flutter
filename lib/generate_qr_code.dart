import 'package:flutter/material.dart';
import 'package:flutter_application_qrr/qr_barcode_scanner.dart';
import 'package:flutter_application_qrr/qr_image.dart';
import 'package:lottie/lottie.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  GenerateQRCodeState createState() => GenerateQRCodeState();
}

class GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR code'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter your URL'),
            ),
          ),
          //This button when pressed navigates to QR code generation
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return QRImage(controller);
                    }),
                  ),
                );
              },
              child: const Text('GENERATE QR CODE')),

          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return const QrBarcodeScanner();
                    }),
                  ),
                );
              },
              child: const Text('BARCODE_SCANNER')),
          Container(
            width: 75,
            height: 75,
            child: Lottie.asset("assets/Lottie/anim.json"),
          ),
        ],
      ),
    );
  }
}
