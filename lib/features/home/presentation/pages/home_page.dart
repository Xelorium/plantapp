import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),

          children: [
            Text(
              'Hi, plant lover!',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                Text(
                  'Good Afternoon!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Icon(Icons.cloud_outlined),
              ],
            ),

            const SizedBox(height: 16),

            // Search
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for plants',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Premium banner
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
            ),

            const SizedBox(height: 20),

            // Category cards...
          ],
        ),
      ),
    );
  }
}

class DiagnosePage extends StatelessWidget {
  const DiagnosePage({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text('Diagnose'));
}

class GardenPage extends StatelessWidget {
  const GardenPage({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text('Garden'));
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text('Profile'));
}

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text('Scanner'));
}
