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
                        color: Color.fromRGBO(18, 35, 41, 1),
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
                          Container(
                            height: 35,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(
                                14,
                                28,
                                33,
                                1,
                              ), // dark background
                              // borderRadius: BorderRadius.circular(8),
                            ),
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: Color.fromRGBO(18, 43, 52, 0.898),
                              unselectedLabelColor: Colors.white,
                              indicator: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              tabs: [
                                Tab(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ), // optional styling
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Tasting notes',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ), // optional styling
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'History',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ), // optional styling
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: TabBarView(
                              children: [
                                ListView(
                                  children: [
                                    SizedBox(height: 10),
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
                                _buildHistoryTab(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
          color: const Color.fromARGB(255, 11, 21, 25),
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
            Icon(Icons.arrow_back, color: Colors.white),
          ],
        ),
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
      color: const Color.fromARGB(255, 14, 28, 33),
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

Widget _buildHistoryTab() {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        _buildTimelineCard(
          title: 'Label',
          subtitle: 'Title',
          descriptions: ['Description', 'Description'],
          attachments: [
            null,
            null,
            null,
          ], // Replace nulls with Image widgets or asset paths
        ),
        SizedBox(height: 20),
        _buildTimelineCard(
          title: 'Label',
          subtitle: 'Title',
          descriptions: ['Description', 'Description'],
          attachments: [null, null, null],
        ),
      ],
    ),
  );
}

Widget _buildTimelineCard({
  required String title,
  required String subtitle,
  required List<String> descriptions,
  required List<ImageProvider?> attachments,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Timeline line and dot
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.amber, width: 2),
            ),
          ),
          Container(width: 2, height: 200, color: Colors.amber),
        ],
      ),
      SizedBox(width: 16),

      // Card content
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Color.fromRGBO(18, 43, 52, 0.898),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.white70)),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              ...descriptions.map(
                (text) => Text(text, style: TextStyle(color: Colors.white70)),
              ),
              SizedBox(height: 12),
              Container(
                color: Colors.black38,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '📎 Attachments',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children:
                          attachments.map((image) {
                            return Container(
                              width: 60,
                              height: 60,
                              margin: const EdgeInsets.only(right: 8),
                              color: Colors.grey.shade800,
                              child:
                                  image != null
                                      ? Image(image: image, fit: BoxFit.cover)
                                      : Icon(
                                        Icons.image,
                                        color: Colors.white38,
                                      ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
