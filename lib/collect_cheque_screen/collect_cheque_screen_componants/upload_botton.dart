import 'package:flutter/material.dart';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200, // Adjust the width as needed
          height: 50, // Adjust the height as needed
          child: ElevatedButton(
            onPressed: () {
              // Add your code here to handle photo upload
              // For example, you can show a file picker or launch the device's camera
            },
            child: Text('Upload cheque image'),
          ),
        ),
        const SizedBox(height: 20), // Add some space between the buttons
        SizedBox(
          width: 200, // Adjust the width as needed
          height: 50, // Adjust the height as needed
          child: ElevatedButton(
            onPressed: () {
              // Add your code here to check the cheque
            },
            child: Text('Check the cheque'),
          ),
        ),
      ],
    );
  }

