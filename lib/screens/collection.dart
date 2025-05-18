import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wineapp/catagory/collection_bloc.dart';
import 'package:wineapp/catagory/collection_state.dart';
import 'package:wineapp/screens/details.dart';

// import 'package:wineapp/details.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

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
          MaterialPageRoute(builder: (_) => DetailPage(imageUrl: imageName)),
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
                  Expanded(
                    child: Image.asset(imageName, fit: BoxFit.fitHeight),
                  ),
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
                  style: TextStyle(
                    fontFamily: 'serif',
                    color: Colors.white,
                    fontSize: 22,
                  ),
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
                  style: TextStyle(
                    fontFamily: 'serif',
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                child: Text(
                  "($quantity/$totalQuantity)",
                  style: TextStyle(
                    fontFamily: 'serif',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionBloc, CollectionState>(
      builder: (context, state) {
        if (state is BottleLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is BottleLoaded) {
          return SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: List.generate(state.bottles.length, (index) {
                final bottle = state.bottles[index];
                return StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 4,
                  child: buildGridTile(
                    context,
                    bottle.image,
                    bottle.title,
                    bottle.age,
                    bottle.quantity,
                    bottle.totalQuantity,
                  ),
                );
              }),
            ),
          );
        } else if (state is BottleError) {
          return Center(
            child: Text(state.message, style: TextStyle(color: Colors.white)),
          );
        }
        return Container();
      },
    );
  }
}
