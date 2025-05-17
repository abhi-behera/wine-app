import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wineapp/details.dart';

// import 'package:wineapp/details.dart';

class CollectionPage extends StatelessWidget {
  // final List<String> imageUrls = [];
  String imageUrl = "assets/bottle_front_labels.png";

  CollectionPage({super.key}); // Add your image URLs or assets
  final imageList = [
    "assets/bottle_front_labels.png",
    "assets/bottle_front_labels.png",
    "assets/bottle_front_labels.png",
    "assets/bottle_front_labels.png",
    "assets/bottle_front_labels.png",
    "assets/bottle_front_labels.png",
    "assets/bottle_front_labels.png",
    "assets/bottle_front_labels.png",
  ];
  final title = [
    "Springbank",
    "Springbank",
    "Springbank",
    "Springbank",
    "Springbank",
    "Springbank",
    "Springbank",
    "Springbank",
  ];
  final age = [
    "1992 # 1234",
    "1992 # 1234",
    "1992 # 1234",
    "1992 # 1234",
    "1992 # 1234",
    "1992 # 1234",
    "1992 # 1234",
    "1992 # 1234",
  ];
  final quantity = [111, 121, 160, 268, 210, 203, 110, 19];
  final totalQuantity = [230, 220, 190, 300, 450, 299, 120, 210];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: category1StaggeredGrid(context));
    // GridView.builder(
    //   padding: EdgeInsets.all(8),
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     crossAxisSpacing: 12,
    //     mainAxisSpacing: 12,
    //   ),
    //   itemCount: 8,
    //   itemBuilder: (context, index) {
    //     return GestureDetector(
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (_) => DetailPage(imageUrl: imageUrl)),
    //         );
    //       },
    //       child:
    //       // category1StaggeredGrid(),
    //       Container(
    //         color: const Color.fromARGB(17, 255, 255, 255),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             Expanded(
    //               flex: 5,
    //               child: Image.asset(imageUrl, fit: BoxFit.cover),
    //             ),
    //             Expanded(
    //               flex: 1,
    //               child: Text(
    //                 "Springbank ",
    //                 style: TextStyle(color: Colors.white, fontSize: 20),
    //               ),
    //             ),
    //             Expanded(
    //               flex: 1,
    //               child: Text(
    //                 "1992 #1234",
    //                 style: TextStyle(color: Colors.white, fontSize: 20),
    //               ),
    //             ),
    //             Expanded(
    //               flex: 1,
    //               child: Text(
    //                 "(112/158)",
    //                 style: TextStyle(color: Colors.white, fontSize: 14),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  StaggeredGrid category1StaggeredGrid(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 4,
          child: buildGridTile(
            context,
            imageList[0],
            title[0],
            age[0],
            quantity[0],
            totalQuantity[0],
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 4,
          child: buildGridTile(
            context,
            imageList[0],
            title[0],
            age[0],
            quantity[0],
            totalQuantity[0],
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 4,
          child: buildGridTile(
            context,
            imageList[0],
            title[0],
            age[0],
            quantity[0],
            totalQuantity[0],
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 4,
          child: buildGridTile(
            context,
            imageList[0],
            title[0],
            age[0],
            quantity[0],
            totalQuantity[0],
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 4,
          child: buildGridTile(
            context,
            imageList[0],
            title[0],
            age[0],
            quantity[0],
            totalQuantity[0],
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 4,
          child: buildGridTile(
            context,
            imageList[0],
            title[0],
            age[0],
            quantity[0],
            totalQuantity[0],
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 4,
          child: buildGridTile(
            context,
            imageList[0],
            title[0],
            age[0],
            quantity[0],
            totalQuantity[0],
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 4,
          child: buildGridTile(
            context,
            imageList[0],
            title[0],
            age[0],
            quantity[0],
            totalQuantity[0],
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 4,
          child: buildGridTile(
            context,
            imageList[0],
            title[0],
            age[0],
            quantity[0],
            totalQuantity[0],
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 4,
          child: buildGridTile(
            context,
            imageList[0],
            title[0],
            age[0],
            quantity[0],
            totalQuantity[0],
          ),
        ),
      ],
    );
  }

  Widget buildGridTile(
    BuildContext context,
    String imageName,
    String title,
    String age,
    int quantity,
    int totalQuantity,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailPage(imageUrl: imageUrl)),
        );
      },
      child: Container(
        color: const Color.fromARGB(17, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: Spacer()),
            Expanded(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset(imageUrl, fit: BoxFit.fitHeight)),
                ],
              ),
            ),
            Expanded(flex: 1, child: Spacer()),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  top: 2.0,
                  bottom: 2.0,
                ),
                child: Text(
                  age,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                child: Text(
                  "($quantity/$totalQuantity)",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocBuilder<BottleBloc, BottleState>(
  //     builder: (context, state) {
  //       if (state is BottleLoading) {
  //         return Center(child: CircularProgressIndicator());
  //       } else if (state is BottleLoaded) {
  //         return Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: MasonryGridView.count(
  //             crossAxisCount: 2,
  //             itemCount: state.bottles.length,
  //             itemBuilder: (context, index) {
  //               final bottle = state.bottles[index];
  //               return Card(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Image.asset(bottle.image),
  //                     Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Text(
  //                         bottle.title,
  //                         style: TextStyle(fontWeight: FontWeight.bold),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 8),
  //                       child: Text(bottle.age),
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: LinearProgressIndicator(
  //                         value: bottle.quantity / bottle.totalQuantity,
  //                         backgroundColor: Colors.grey[300],
  //                         valueColor: AlwaysStoppedAnimation(Colors.green),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               );
  //             },
  //           ),
  //         );
  //       } else if (state is BottleError) {
  //         return Center(child: Text(state.message));
  //       }
  //       return Container();
  //     },
  //   );
  // }
}
