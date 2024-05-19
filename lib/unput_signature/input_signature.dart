import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'dart:typed_data';

class InputSignature extends StatefulWidget {
  static String routeName = "/inputSegnature";
  const InputSignature({Key? key}) : super(key: key);

  @override
  State<InputSignature> createState() => _InputSignature();
}

class _InputSignature extends State<InputSignature> {
  final _signatureController = SignatureController(
    penStrokeWidth: 2.0,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  bool _isClearButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _signatureController.addListener(() {
      setState(() {
        _isClearButtonDisabled = _signatureController.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  Future<void> _exportSignature() async {
    try {
      final signatureImage = await _signatureController.toImage();
      if (signatureImage != null) {
        final bytes = await signatureImage.toByteData();
        if (bytes != null) {
          await FilePicker.platform.saveFile(
            fileName: 'signature.png',
            bytes: bytes.buffer.asUint8List(),
            type: FileType.image,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Signature exported successfully!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: Could not convert image to bytes.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred while creating the image.')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'Add Signature',
        style: TextStyle(fontSize: 24),
      ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.amber.shade50],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1, // 80% of device width
                height: MediaQuery.of(context).size.height * 0.3, // Use one-third of device height
                child: Signature(
                  width: double.infinity,
                  height: double.infinity, // Use full available height
                  controller: _signatureController,
                  backgroundColor: Colors.grey[300] ?? Colors.grey, // Set background color to light gray with fallback
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _isClearButtonDisabled ? null : _signatureController.clear,
                      child: Text('Clear'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[900],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _exportSignature,
                      child: Text('Export'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[900],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
