import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Google_Image_Search extends StatefulWidget {
  @override
  _Google_Image_SearchState createState() => _Google_Image_SearchState();
}

class _Google_Image_SearchState extends State<Google_Image_Search> {
  String _searchQuery = "";
  List<String> _imageUrls = [];
  final Dio _dio = Dio(); // Initialize Dio

  // Replace with your Google API Key and Custom Search Engine ID
  final String apiKey = "AIzaSyCs1k7CprUxOOtGEm7PaVCZO85PS9xRK6A";
  final String cx = "21860bf540d764e75";

  // Function to search images
  Future<void> searchImages(String query) async {
    final String url =
        'https://www.googleapis.com/customsearch/v1?q=$query&cx=$cx&key=$apiKey&searchType=image';

    // List of event-related keywords
    List<String> eventKeywords = [
      'event', 'party', 'celebration', 'wedding', 'conference', 'meeting',
      'birthday', 'festival', 'ceremony', 'gathering', 'decoration', 'banquet',
"Wedding decoration ideas","Birthday party themes","Corporate event setups","Baby shower decoration themes","Graduation party decorations",
"Holiday event decor ideas","Festival event decorations","Bridal shower themes",
"Wedding reception decoration ideas","Rustic wedding decor","Vintage party decorations","Bohemian style event setup","Modern event design",
"Minimalist wedding ideas","Glamorous birthday party decor","Garden wedding themes","Outdoor event decor ideas",
"Blue and white wedding decor","Gold and blush event decor","Pastel colored event decorations",
"Black and gold party decorations","Pink themed birthday party ideas" , "Balloon arch designs"
"Flower wall decoration ideas""Table centerpieces for events""Chandeliers for event decoration"
"Fairy lights decoration ideas""Tented event setup""DIY decor ideas for events""Fabric draping for weddings"
"Beach wedding decor ideas","Outdoor garden party setup","Indoor event decoration ideas",
"Venue entrance decoration ideas","Rustic barn wedding decor","Luxury hotel event decoration","Cheap wedding decoration ideas",
"Budget-friendly event setup","Affordable party decorations","DIY event decor ideas on a budget",
"Summer wedding decoration ideas",
"Winter event decor themes",
"Spring festival decoration ideas",
"Autumn wedding ideas",
"Christmas party decoration themes",
"Halloween party decoration ideas",
"Thanksgiving decoration ideas",
"New Year's Eve party decoration ideas",
"Industrial style event decor",
"Luxury event decoration",
"Eco-friendly event decoration ideas",
"DIY rustic wedding ideas",
"Traditional Indian wedding decor",
"Photo booth setup ideas",
"Cocktail party decoration ideas",
"Stage setup for corporate events",
"Food table decoration for events",
"Event signage and branding ideas",

];

    // Check if the query contains any event-related keyword
    bool isEventRelated = eventKeywords.any((keyword) => query.toLowerCase().contains(keyword));

    if (!isEventRelated) {
      setState(() {
        _imageUrls = [];
      });
      print("The search term is not related to event management.");
      return; // Exit early if it's not event-related
    }

    try {
      // Make GET request using Dio
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data; // Access JSON data directly

        // Check if 'items' exists and is a list
        if (data.containsKey('items') && data['items'] is List) {
          setState(() {
            // Limit to 2 images only
            _imageUrls = (data['items'] as List)
                .take(2) // Limit to 2 items
                .map<String>((item) => item['link'] as String)
                .toList();
          });
        } else {
          setState(() {
            _imageUrls = [];
          });
          print("No images found for the query.");
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } on DioError catch (e) {
      // Handle Dio errors, including connection or format issues
      if (e.response != null) {
        print("Error: ${e.response?.statusCode}");
        print("Data: ${e.response?.data}");
      } else {
        print("Error: ${e.message}");
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image generator"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                _searchQuery = value;
              },
              decoration: InputDecoration(
                hintText: "Enter search term related to event",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Add a button to trigger search
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Call searchImages when the button is pressed
                if (_searchQuery.isNotEmpty) {
                  searchImages(_searchQuery);
                }
              },
              child: Text('Generate Images'),
            ),
          ),
          // Display the images in a grid or message for non-event-related queries
          _imageUrls.isEmpty
              ? Center(child: Text("Not related to event management"))
              : GridView.builder(
                  shrinkWrap: true, // Prevents the grid from taking full screen
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _imageUrls.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Display 2 images in a row
                  ),
                  itemBuilder: (context, index) {
                    return Image.network(_imageUrls[index]);
                  },
                ),
        ],
      ),
    );
  }
}
