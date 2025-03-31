import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Import Firebase Storage
import 'package:path_provider/path_provider.dart'; // Import for file storage
import 'dart:io'; // Import for File operations

class GravityDownload extends StatefulWidget {
  const GravityDownload({super.key});

  @override
  State<GravityDownload> createState() => _GravityDownloadState();
}

class _GravityDownloadState extends State<GravityDownload> {
  void _downloadFile() async {
    try {
      final ref =
          FirebaseStorage.instance.ref('gravity_whitepaper_30-mar-2025.pdf');
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/gravity_whitepaper_30-mar-2025.pdf';
      final file = File(filePath);

      await ref.writeToFile(file); // Download the file to local storage
    } catch (e) {
      print("Error downloading file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: _downloadFile, // Updated onPressed to call _downloadFile
          child: const Text(
            "Download Gravity",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
