import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrBarcodeScanner extends StatefulWidget {
  const QrBarcodeScanner({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _BarcodeScannerDemoState createState() => _BarcodeScannerDemoState();
}

class _BarcodeScannerDemoState extends State<QrBarcodeScanner> {
  String _scanBarcode = 'Unknown';

  /// For Continuous scan
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> barcodeScan() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Barcode Scanner Demo'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.cyan,
        ),
        body: Builder(builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Image(
                      image: AssetImage("assets/devs.jpg"),
                      height: 150,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text('Scan result : $_scanBarcode\n',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyan,
                          ),
                          onPressed: () => barcodeScan(),
                          child: const Text('Barcode Scan',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold))),
                    ),
                  ]));
        }));
  }
}
