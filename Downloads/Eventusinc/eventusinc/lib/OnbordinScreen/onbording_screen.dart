import 'package:eventusinc/Auth/login_page.dart';
import 'package:flutter/material.dart';
// আপনার প্রজেক্ট অনুযায়ী ইমপোর্ট পাথ চেক করুন

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/onbording1.png",
      "title": "Take Control of Every Load",
      "desc": "Stay updated with your assigned deliveries in real-time.\nView routes, pickup and drop-off details\nall in one simple dashboard."
    },
    {
      "image": "assets/images/onbording2.png",
      "title": "Upload, Verify, and Hit the Road",
      "desc": "Securely upload your CDL, W-9, and insurance documents.\nOnce verified, you’re ready to start\naccepting loads instantly."
    },
    {
      "image": "assets/images/onbording3.png",
      "title": "Deliver Loads, Get Paid Fast",
      "desc": "Complete your deliveries and receive payments directly through ACH — no paperwork, no delays, just smooth settlements."
    },
  ];

  // Navigation to Login Page Function
  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) => _buildPage(index),
              ),
            ),
            _buildBottomControls(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(height: 60),
          // --- Illustration Section ---
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Top Left: Orange Circle (16x16)
                _buildFloatingCircle(
                  top: 20, left: 20, size: 16, 
                  colors: [const Color(0xFFFEE1D2), const Color(0x00FA894C)],
                ),
                // Bottom Right: Blue Circle (24x24)
                _buildFloatingCircle(
                  bottom: 20, right: 20, size: 24, 
                  colors: [const Color(0xFFD3DAFD), const Color(0x003D5BF6)],
                ),
                // Top Right: Light Blue (Decorative)
                _buildFloatingCircle(
                  top: 10, right: 40, size: 14, 
                  colors: [const Color(0xFFE3F2FF), const Color(0x00E3F2FF)],
                ),

                // Main Image Container (250x250)
                Container(
                  width: 250,
                  height: 250,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset(
                      _onboardingData[index]["image"]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Floating Icon Badge (White circle with orange center)
                Positioned(
                  bottom: 50,
                  left: 30,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15, spreadRadius: 2)],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFFD0A030),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.grid_view_rounded, color: Colors.white, size: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Page Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) => _buildDot(i)),
          ),
          const SizedBox(height: 40),
          
          // --- Text Content ---
          Text(
            _onboardingData[index]["title"]!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26, 
              fontWeight: FontWeight.w900, 
              color: Color(0xFF1F2937),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _onboardingData[index]["desc"]!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15, 
              color: Color(0xFF9CA3AF), 
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    bool isActive = _currentPage == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isActive ? const Color(0xFF3B82F6) : const Color(0xFFD1D5DB),
      ),
    );
  }

  Widget _buildFloatingCircle({double? top, double? left, double? right, double? bottom, required double size, required List<Color> colors}) {
    return Positioned(
      top: top, left: left, right: right, bottom: bottom,
      child: Container(
        width: size, height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: colors, 
            begin: Alignment.topLeft, 
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          // Next Button (Linear Gradient)
          GestureDetector(
            onTap: () {
              if (_currentPage < _onboardingData.length - 1) {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300), 
                  curve: Curves.easeInOut
                );
              } else {
                _goToLogin(); // ৩ নম্বর পেজ শেষে লগইন পেজে যাবে
              }
            },
            child: Container(
              width: double.infinity,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Color(0xFFD0A030), Color(0xFFD58738)],
                ),
              ),
              child: Center(
                child: Text(
                  _currentPage == 2 ? "Get Started" : "Next", 
                  style: const TextStyle(
                    color: Colors.white, 
                    fontSize: 18, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Skip Button
          GestureDetector(
            onTap: _goToLogin, // Skip এ ক্লিক করলে সরাসরি লগইন পেজে যাবে
            child: Container(
              width: double.infinity,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: const Center(
                child: Text(
                  "Skip", 
                  style: TextStyle(
                    color: Color(0xFFD0A130), 
                    fontSize: 18, 
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}