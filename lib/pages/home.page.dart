import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),

            // Add your image at the top
            Image.asset(
              'assets/steps.png', // Replace with your image path
              height: 300, // Adjust the height as needed
            ),
            SizedBox(height: 30),

            Stepper(
              currentStep: _currentStep,
              onStepTapped: (step) => setState(() => _currentStep = step),
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Container(); // Remove continue and cancel buttons
              },
              steps: [
                Step(
                  title: Row(
                    children: [
                      Icon(Icons.camera_alt),
                      SizedBox(width: 8),
                      Text('Scan Pictures'),
                    ],
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Scan your pictures using our scanning tool to extract text and transfom it to a PDF file.'),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/scan');
                        },
                        child: Text("Scan Pictures"),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep > 0 ? StepState.complete : StepState.indexed,
                ),
                Step(
                  title: Row(
                    children: [
                      Icon(Icons.picture_as_pdf),
                      SizedBox(width: 8),
                      Text('Upload PDF files'),
                    ],
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Upload your PDF files to the database to use it later on in the extraction.'),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/upload');
                        },
                        child: Text("Upload PDF"),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 1,
                  state: _currentStep > 1 ? StepState.complete : StepState.indexed,
                ),
                Step(
                  title: Row(
                    children: [
                      Icon(Icons.file_download),
                      SizedBox(width: 8),
                      Text('Extract'),
                    ],
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Extract information from your files quickly and easily using our AI model.'),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Handle extraction logic here
                        },
                        child: Text("Extract"),
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 2,
                  state: _currentStep == 2 ? StepState.complete : StepState.indexed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
