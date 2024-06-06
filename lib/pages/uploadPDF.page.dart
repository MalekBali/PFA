import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<String> _pdfUrls = [];

  @override
  void initState() {
    super.initState();
    _loadPdfFiles();
  }

  Future<void> _loadPdfFiles() async {
    try {
      final ListResult result = await _storage.ref().child('pdfs').listAll();
      final List<String> urls = await Future.wait(
          result.items.map((ref) => ref.getDownloadURL()).toList());
      setState(() {
        _pdfUrls = urls;
      });
      print (_pdfUrls);
    } catch (e) {
      print("Failed to load PDF files: $e");
    }
  }

  Future<void> _uploadPdf() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      final fileName = basename(file.name);
      final destination = 'pdfs/$fileName';

      final ref = _storage.ref(destination);
      try {
        await ref.putFile(File(file.path!));
        final url = await ref.getDownloadURL();
        setState(() {
          _pdfUrls.add(url);
        });
      } catch (e) {
        print("Failed to upload PDF file: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Upload'),
      ),
      body: Center(
        child: _pdfUrls.isEmpty
            ? Text('No PDF files found.')
            : ListView.builder(
                itemCount: _pdfUrls.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('PDF ${index + 1}'),
                    subtitle: Text(_pdfUrls[index]),
                    onTap: () {
                      // Handle PDF file opening
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _uploadPdf,
        child: Icon(Icons.upload_file),
      ),
    );
  }
}
