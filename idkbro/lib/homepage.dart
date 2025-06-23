import 'dart:io';

import 'package:flutter/material.dart';
import 'package:idkbro/widget/deviceinfo.dart';
import 'package:idkbro/widget/getlocation.dart';
import 'package:idkbro/widget/scanbarqr.dart';
import 'package:idkbro/widget/pickgallery.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  File? returnedImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(const Size(200, 50)),
                ),
                onPressed: () {
                  ImageUtils.pickimage(
                    onImagepicked: (file) {
                      setState(() {
                        returnedImage = file;
                      });
                    },
                  );
                },
                child: const Text("Pick From Gallery"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(const Size(200, 50)),
                ),
                onPressed: () {
                  ImageUtils.pickFromCamera(
                    onImagePicked: (file) {
                      setState(() {
                        returnedImage = file;
                      });
                    },
                  );
                },
                child: const Text("Pick From Camera"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(const Size(200, 50)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScanBarQr()),
                  );
                },
                child: const Text("Scan QR Code"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(const Size(200, 50)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DeviceInfo()),
                  );
                },
                child: const Text("Device Info"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(const Size(200, 50)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Getlocation(),
                    ),
                  );
                },
                child: const Text("Get Location"),
              ),
              const SizedBox(height: 50),

              //showa image
              //on tap will remove img
              returnedImage != null
                  ? GestureDetector(
                    onTap: () {
                      ImageUtils.removeImage(
                        onRemove: () {
                          setState(() {
                            returnedImage = null;
                          });
                        },
                      );
                    },
                    child: Image.file(returnedImage!, height: 200),
                  )
                  : //see isit null
                  const Text(""),
            ],
          ),
        ),
      ),
    );
  }
}
