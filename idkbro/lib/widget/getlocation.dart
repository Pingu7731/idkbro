import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Getlocation extends StatefulWidget {
  const Getlocation({super.key});

  @override
  State<Getlocation> createState() => _GetlocationState();
}

class _GetlocationState extends State<Getlocation> {
  String currentCoordinate = "你在哪?";
  String detailedAdrress = "我找不到你.";

  Future<void> getLocationAdd() async {
    //need to have location permission to get location
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      setState(() {
        currentCoordinate = "why you don wan enable permission??";
        detailedAdrress = "whyyyy";
      });
    }
    //fetch location
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(accuracy: LocationAccuracy.high),
      );
      setState(() {
        currentCoordinate =
            "經緯度 : ${position.latitude.toStringAsFixed(6)},${position.longitude.toStringAsFixed(6)}";
      });
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      //change to detail location
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          detailedAdrress =
              "${place.locality ?? ''} ${place.subLocality ?? ''} ${place.street ?? ''}";
        });
      }
    } catch (e) {
      setState(() {
        currentCoordinate = "還是找不到你";
        detailedAdrress = "還是找不到你";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Current Location",
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentCoordinate,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Text(
              detailedAdrress,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getLocationAdd,
        child: Icon(Icons.location_on),
      ),
    );
  }
}
