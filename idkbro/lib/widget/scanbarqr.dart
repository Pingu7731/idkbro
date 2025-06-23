import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanBarQr extends StatefulWidget {
  const ScanBarQr({super.key});

  @override
  State<ScanBarQr> createState() => _ScanBarQrState();
}

class _ScanBarQrState extends State<ScanBarQr> {
  String scannedData = "Scan QR / Barcode";
  bool isScanned = false;

  void handleDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.first;
    if (!isScanned && barcode.rawValue != null) {
      final code = barcode.rawValue;
      setState(() {
        isScanned = true;
        scannedData = code!;
      });
      sendCodeToServer(code!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Scan QR / Barcode",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: MobileScanner(
              controller: MobileScannerController(),
              onDetect: handleDetect,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: removeCode,
                child: Text(
                  scannedData,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void removeCode() {
    setState(() {
      scannedData = 'Scan Again';
      isScanned = false;
    });
  }

  Future<void> sendCodeToServer(String code) async {
    final url = Uri.parse("");
    // final url = Uri.parse("http://<ipv4>/php_api/scan.php");
    try {
      final response = await http.post(url, body: {'code': code});
      if (response.statusCode == 200) {
        print("Success : ${response.body}");
      } else {
        print("HTTP ERR: ${response.statusCode}");
      }
    } catch (e) {
      print("Err Connection: $e");
    }
  }
}
