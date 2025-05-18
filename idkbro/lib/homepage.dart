import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
                onPressed: () {},
                child: const Text("Pick From Gallery"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(const Size(200, 50)),
                ),
                onPressed: () {},
                child: const Text("Pick From Camera"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(const Size(200, 50)),
                ),
                onPressed: () {},
                child: const Text("Scan QR Code"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(const Size(200, 50)),
                ),
                onPressed: () {},
                child: const Text("Device Info"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(const Size(200, 50)),
                ),
                onPressed: () {},
                child: const Text("Get Location"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
