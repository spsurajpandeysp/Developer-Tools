import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToolsScreen extends StatelessWidget {
  final String category;
  final Map<String, List<Map<String, String>>> toolsData;

  ToolsScreen({required this.category, required this.toolsData});

  // Function to save the favorite status in local storage
  Future<void> toggleFavorite(String toolName, bool isFavorite) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(toolName, isFavorite);
  }

  // Function to get the favorite status from local storage
  Future<bool> getFavoriteStatus(String toolName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(toolName) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final tools = toolsData[category];

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Tools'),
        backgroundColor: Color(0xFF0e86d4),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Logic to add new tool (this can be a new screen or a modal)
                },
                child: Text("Add Tool"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF68bbe3),
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: tools?.length ?? 0,
                itemBuilder: (context, index) {
                  final tool = tools![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ToolDetailScreen(tool: tool),
                        ),
                      );
                    },
                    child: FutureBuilder<bool>(
                      future: getFavoriteStatus(tool['name'] ?? ''),
                      builder: (context, snapshot) {
                        bool isFavorite = snapshot.data ?? false;

                        return Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFF055c9d),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(tool['logo'] ?? ''),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    tool['name'] ?? 'Tool Name',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    tool['description'] ?? 'Tool Description',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.star : Icons.star_border,
                                  color: isFavorite ? Colors.yellow : Colors.white,
                                ),
                                onPressed: () {
                                  toggleFavorite(tool['name'] ?? '', !isFavorite);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToolDetailScreen extends StatelessWidget {
  final Map<String, String> tool;

  ToolDetailScreen({required this.tool});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tool['name'] ?? 'Tool Detail'),
        backgroundColor: Color(0xFF0e86d4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(tool['logo'] ?? ''),
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 20),
            Text(
              tool['name'] ?? '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF055c9d),
              ),
            ),
            SizedBox(height: 10),
            Text(
              tool['description'] ?? '',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
