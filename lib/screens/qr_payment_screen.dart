import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class QRPaymentScreen extends StatelessWidget {
  const QRPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("QR Payment", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Camera placeholder simulation
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                // Scan Frame
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.accentBlue, width: 4),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                // Corner accents (optional but looks modern)
                Positioned(
                  top: 0, bottom: 0, left: 0, right: 0,
                  child: CustomPaint(painter: ScannerFramePainter()),
                ),
                const Icon(Icons.qr_code, color: Colors.white24, size: 100),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "Scan QR code to pay",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          const Text(
            "Place the QR code inside the frame",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildControlIcon(Icons.flash_on),
              _buildControlIcon(Icons.image),
              _buildControlIcon(Icons.history),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildControlIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}

class ScannerFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Custom drawing for a more "dynamic" frame if needed
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
