import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String imageUrl;

  const DetailPage({super.key, required this.imageUrl});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = const [
    Tab(text: 'Details'),
    Tab(text: 'Tasting Notes'),
    Tab(text: 'History'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: const Color.fromARGB(255, 6, 18, 22),
  //     body: Stack(
  //       children: [
  //         Positioned.fill(
  //           child: Image.asset('assets/backgroundimage.png', fit: BoxFit.cover),
  //         ),
  //         SafeArea(
  //           child: NestedScrollView(
  //             headerSliverBuilder:
  //                 (context, innerBoxIsScrolled) => [
  //                   SliverToBoxAdapter(child: _buildTopBar(context)),
  //                   SliverToBoxAdapter(child: _buildBottleInfo()),
  //                   SliverToBoxAdapter(
  //                     child: Center(
  //                       child: Image.asset(
  //                         widget.imageUrl,
  //                         height: 250,
  //                         fit: BoxFit.contain,
  //                       ),
  //                     ),
  //                   ),
  //                   // SliverToBoxAdapter(
  //                   //   child: _buildAddToCollectionButton(context),
  //                   // ),
  //                   SliverPersistentHeader(
  //                     pinned: false,
  //                     delegate: _SliverTabBarDelegate(
  //                       TabBar(
  //                         controller: _tabController,
  //                         labelColor: Colors.amber,
  //                         unselectedLabelColor: Colors.white,
  //                         indicatorColor: Colors.amber,
  //                         tabs: myTabs,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //             body: TabBarView(
  //               controller: _tabController,
  //               children: [
  //                 _buildDetailsCard(),
  //                 _buildTastingNotesTab(),
  //                 _buildHistoryTab(),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 18, 22),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/backgroundimage.png', fit: BoxFit.cover),
          ),

          /// Scrollable Content
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ), // Adjust for fixed top and bottom
              child: NestedScrollView(
                headerSliverBuilder:
                    (context, innerBoxIsScrolled) => [
                      SliverToBoxAdapter(child: SizedBox(height: 80)),
                      SliverToBoxAdapter(child: _buildBottleInfo()),
                      SliverToBoxAdapter(
                        child: Center(
                          child: Image.asset(
                            widget.imageUrl,
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverTabBarDelegate(
                          TabBar(
                            controller: _tabController,
                            labelColor: Colors.amber,
                            unselectedLabelColor: Colors.white,
                            indicatorColor: Colors.amber,
                            tabs: myTabs,
                          ),
                        ),
                      ),
                    ],
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildDetailsCard(),
                    _buildTastingNotesTab(),
                    _buildHistoryTab(),
                  ],
                ),
              ),
            ),
          ),

          /// Fixed Top Bar
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Container(
              // color: const Color(0xFF0B1D23),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              height: 60,
              child: _buildTopBar(context),
            ),
          ),

          /// Fixed Bottom Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color.fromARGB(255, 6, 18, 22),
              padding: const EdgeInsets.all(16),
              child: _buildAddToCollectionButton(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: const Color(0xFF0B1D23),
            child: const Text(
              'Genesis Collection',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF0B1D23),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottleInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(color: const Color.fromARGB(255, 6, 18, 22)),
        child: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.asset('assets/genuine-icon.png'),
            ),
            const SizedBox(width: 8),
            const Text(
              'Genuine Bottle (Unopened)',
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down, color: Colors.yellow),
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCollectionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {},
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: Colors.amber,
          //   foregroundColor: Colors.black,
          //   padding: const EdgeInsets.symmetric(vertical: 16),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          // ),
          // icon: const Icon(Icons.add),
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Add to my collection',
              style: TextStyle(fontFamily: 'serif', fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsCard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(18, 35, 41, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bottle 135/184',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 4),
            const Text.rich(
              TextSpan(
                text: 'Talisker ',
                style: TextStyle(
                  fontFamily: 'serif',
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
            const SizedBox(height: 4),
            const Text(
              '#2504',
              style: TextStyle(
                fontFamily: 'serif',
                color: Colors.white70,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 16),
            ...[
              'Distillery',
              'Region',
              'Country',
              'Type',
              'Age statement',
              'Filled',
              'Bottled',
              'Cask number',
              'ABV',
              'Size',
              'Finish',
            ].map((label) => _buildDetailRow(label, 'Text')),
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
          Text(label, style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildTastingNotesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: const Color.fromARGB(255, 11, 21, 25),
            child: const Center(
              child: Icon(Icons.play_arrow, size: 50, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Tasting notes',
            style: TextStyle(
              fontFamily: 'serif',
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'by Charles MacLean MBE',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          _buildNoteSection('Nose', ['Description', 'Description']),
          _buildNoteSection('Palate', ['Description']),
          _buildNoteSection('Finish', ['Description']),
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
            style: const TextStyle(
              fontFamily: 'serif',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          ...descriptions.map(
            (desc) => Text(desc, style: const TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 2,
      itemBuilder: (context, index) => _buildTimelineCard(),
    );
  }

  Widget _buildTimelineCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            Container(width: 2, height: 260, color: Colors.amber),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(18, 43, 52, 0.898),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Label', style: TextStyle(color: Colors.white70)),
                const Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Description',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                const Text(
                  '📎 Attachments',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(
                    3,
                    (index) => Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.only(right: 8),
                      color: Colors.grey.shade800,
                      child: const Icon(Icons.image, color: Colors.white38),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// A custom SliverPersistentHeaderDelegate for TabBar
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: const Color(0xFF0B1D23), child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
