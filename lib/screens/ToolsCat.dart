import 'package:flutter/material.dart';
import 'package:tools/screens/ToolsScreen.dart';

class ToolsCat extends StatelessWidget {
  final Map<String, List<Map<String, String>>> toolsData = {
    'SEO': [
      {'name': 'Keyword Research Tool', 'description': 'Find the best keywords.'},
      {'name': 'SEO Analyzer', 'description': 'Analyze SEO performance.'},
      {'name': 'Backlink Checker', 'description': 'Check backlinks.'},
    ],
    'Design': [
      {'name': 'Canva', 'description': 'Create stunning graphics.'},
      {'name': 'Figma', 'description': 'Collaborative design tool.'},
    ],
    'Development': [
      {'name': 'GitHub', 'description': 'Git repository hosting.'},
      {'name': 'VS Code', 'description': 'Code editor for developers.'},
    ],
    'Analytics': [
      {'name': 'Google Analytics', 'description': 'Track website traffic.'},
      {'name': 'Hotjar', 'description': 'Heatmaps for user experience.'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: toolsData.keys.map((category) {
            return GestureDetector(
              onTap: () {
                // Navigate to the ToolsCategoryPage with the selected category
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ToolsScreen(category: category, toolsData: toolsData),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFF1f1f1f), // Dark grey for background
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Replace with logo or image related to SEO tools
                    Icon(
                      Icons.search,  // A search icon to represent SEO tools
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      category,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
