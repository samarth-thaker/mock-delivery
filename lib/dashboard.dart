import 'package:deliveryapp/taskTile.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today's pickups"),
        backgroundColor: const Color(0xFF147C8C),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // consistent padding
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Tasktile(
                      id: 1,
                      location: LatLng(12.971598, 77.594566),
                      timeSlot: "9AM-10AM",
                      inventory: 5,
                    ),
                    SizedBox(height: 20),
                    Tasktile(
                      id: 2,
                      location: LatLng(12.972819, 77.595212),
                      timeSlot: "9AM-10AM",
                      inventory: 3,
                    ),
                    SizedBox(height: 20),
                    Tasktile(
                      id: 3,
                      location: LatLng(12.963842, 77.609043),
                      timeSlot: "9AM-10AM",
                      inventory: 7,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/navigate');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF147C8C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Navigate route',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
