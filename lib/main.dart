import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final random = Random();
  String selectedColor = "0xFF2196F3";
  var randomColor = "";
  List<String> colorHexList = [
    "#9E9E9E", // Grey
    "#4CAF50", // Green
    "#2196F3", // Blue
    "#E91E63", // Pink
    "#00BCD4", // Cyan
    "#FFEB3B", // Yellow
    "#9C27B0", // Purple
    "#F44336", // Red
    "#4CAF50", // Green (again)
    "#2196F3", // Blue (again)
  ];

  void _changeColor() {
    setState(() {
      randomColor = colorHexList[random.nextInt(colorHexList.length)];
      selectedColor = randomColor.replaceFirst("#", "0xFF");
    });
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: selectedColor.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(int.parse(selectedColor)),
        appBar: AppBar(title: const Text('My App')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _changeColor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Change Color'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _copyToClipboard,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                child: const Text('Copy to clipboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
