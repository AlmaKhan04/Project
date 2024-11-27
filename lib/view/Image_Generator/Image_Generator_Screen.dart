import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Image_Generator_Screen extends StatefulWidget {
  @override
  _Image_Generator_ScreenState createState() => _Image_Generator_ScreenState();
}

class _Image_Generator_ScreenState extends State<Image_Generator_Screen> {
  String _prompt = '';
  List<String> _generatedImages = [];
  String _selectedModel = 'Flux';
  String _selectedStyle = 'No Style';
  int _imageCount = 1;
  double _aspectRatio = 4 / 5;
  bool _isLoading = false;

  Future<void> generateImage() async {
    setState(() {
      _isLoading = true;
    });

    // Replace this URL with Imagine AI’s endpoint
    final apiUrl = 'https://api.vyro.ai/v1/imagine/api/generations';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer vk-V2n1F18VR2ExBB6hMpu2265FnM04MRjqv3XLD3PFDloage', // Replace with Imagine AI API key
        },
        body: jsonEncode({
          'prompt': _prompt,
          'model': _selectedModel,
          'style': _selectedStyle,
          'count': _imageCount,
          'aspect_ratio': _aspectRatio,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          _generatedImages = List<String>.from(responseData['images']);
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Image Generator")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Models"),
            Row(
              children: ['Flux', 'Flux Dev', 'Realistic', 'Anime'].map((model) {
                return ChoiceChip(
                  label: Text(model),
                  selected: _selectedModel == model,
                  onSelected: (selected) {
                    setState(() {
                      _selectedModel = model;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text("Styles"),
            Row(
              children: ['No Style', 'Halloween', 'Icon'].map((style) {
                return ChoiceChip(
                  label: Text(style),
                  selected: _selectedStyle == style,
                  onSelected: (selected) {
                    setState(() {
                      _selectedStyle = style;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text("Number of Images"),
            Row(
              children: [1, 2, 3, 4].map((count) {
                return ChoiceChip(
                  label: Text('$count'),
                  selected: _imageCount == count,
                  onSelected: (selected) {
                    setState(() {
                      _imageCount = count;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text("Aspect Ratio"),
            Slider(
              value: _aspectRatio,
              min: 0.5,
              max: 2.0,
              onChanged: (value) {
                setState(() {
                  _aspectRatio = value;
                });
              },
              label: _aspectRatio.toStringAsFixed(2),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Prompt',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                _prompt = text;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : generateImage,
              child: _isLoading ? CircularProgressIndicator() : Text("Generate"),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: _generatedImages.length,
                itemBuilder: (context, index) {
                  return Image.network(_generatedImages[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
