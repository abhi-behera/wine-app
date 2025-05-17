import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imageUrl;

  const DetailPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/backgroundimage.png',
                fit: BoxFit.cover,
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  // Header section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Genesis Collection',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),

                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.settings, size: 16, color: Colors.yellow),
                          SizedBox(width: 8),
                          Text(
                            'Genuine Bottle (Unopened)',
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_down, color: Colors.yellow),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  Center(
                    child: Image.asset(
                      imageUrl,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(14, 28, 33, 0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bottle 135/184',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text.rich(
                            TextSpan(
                              text: 'Talisker ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: '18 Year old',
                                  style: TextStyle(color: Colors.amber),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '#2504',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 19,
                            ),
                          ),
                          SizedBox(height: 16),

                          // TabBar
                          TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.white,
                            indicator: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            tabs: [
                              Tab(text: 'Details'),
                              Tab(text: 'Tasting notes'),
                              Tab(text: 'History'),
                            ],
                          ),

                          Expanded(
                            child: TabBarView(
                              children: [
                                ListView(
                                  children: [
                                    _buildDetailRow('Distillery', 'Text'),
                                    _buildDetailRow('Region', 'Text'),
                                    _buildDetailRow('Country', 'Text'),
                                    _buildDetailRow('Type', 'Text'),
                                    _buildDetailRow('Age statement', 'Text'),
                                    _buildDetailRow('Filled', 'Text'),
                                    _buildDetailRow('Bottled', 'Text'),
                                    _buildDetailRow('Cask number', 'Text'),
                                    _buildDetailRow('ABV', 'Text'),
                                    _buildDetailRow('Size', 'Text'),
                                    _buildDetailRow('Finish', 'Text'),
                                  ],
                                ),
                                _buildTastingNotesTab(),
                                Center(
                                  child: Text(
                                    'History',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: Icon(Icons.add),
                        label: Text(
                          'Add to my collection',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.white70)),
          Text(value, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

Widget _buildTastingNotesTab() {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Video Placeholder
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.black.withOpacity(0.6),
          child: Center(
            child: Icon(Icons.play_arrow, size: 50, color: Colors.white),
          ),
        ),
        SizedBox(height: 20),

        // Tasting Notes Heading
        Text(
          'Tasting notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text('by Charles MacLean MBE', style: TextStyle(color: Colors.white70)),
        SizedBox(height: 16),

        // Sections
        _buildNoteSection('Nose', [
          'Description',
          'Description',
          'Description',
        ]),
        _buildNoteSection('Palate', [
          'Description',
          'Description',
          'Description',
        ]),
        _buildNoteSection('Finish', [
          'Description',
          'Description',
          'Description',
        ]),

        SizedBox(height: 20),

        // Your Notes Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your notes',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ],
    ),
  );
}

Widget _buildNoteSection(String title, List<String> descriptions) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        ...descriptions.map(
          (desc) => Text(desc, style: TextStyle(color: Colors.white70)),
        ),
      ],
    ),
  );
}
