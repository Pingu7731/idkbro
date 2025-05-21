import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({super.key});

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  final deviceInfo = DeviceInfoPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Device Info",
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
      body: showAndroidInfo(),
    );
  }

  Widget showAndroidInfo() {
    return FutureBuilder<AndroidDeviceInfo>(
      future: deviceInfo.androidInfo,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } //show loading icon
        
        else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.white),
            ),
          );

        } else if (snapshot.hasData) {
          final info = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInfoRow("Brand", info.brand),
                buildInfoRow("Model", info.model),
                buildInfoRow("Device", info.device),
                buildInfoRow("Android Version", info.version.release),
                buildInfoRow("SDK", info.version.sdkInt.toString()),
                buildInfoRow("Display",info.display),
                buildInfoRow("Manufacturer",info.manufacturer),
                buildInfoRow("Hardware",info.hardware),
                buildInfoRow("Serial Number",info.serialNumber),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("No data", style: TextStyle(color: Colors.white)),
          );
        }
      },
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        "$label: $value",
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
