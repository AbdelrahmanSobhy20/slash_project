import 'package:flutter/material.dart';
import 'package:slashtraining/features/home/presentation/screens/home_screen.dart';
import 'features/product_details/data/models/data_map.dart';
import 'features/product_details/data/repo/details_repo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen()
      // FutureBuilder<DataMap>(
      //   future: DetailsRepo().getProductDetails(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasError) {
      //       print(snapshot.error);
      //       return Center(
      //           child: Text(
      //             snapshot.error.toString(),
      //             style: const TextStyle(
      //                 color: Colors.white, fontSize: 30),
      //           ));
      //     }
      //     if (snapshot.hasData) {
      //       return Center(
      //         child: Column(
      //           children: [
      //             const SizedBox(height: 150,),
      //             Text(snapshot.data.data.id.toString(), style: const TextStyle(
      //               color: Colors.white,
      //               fontSize: 50
      //             ), ),
      //             // Image.network(snapshot
      //             //     .data.variations[0].ProductVarientImages[0].image_path)
      //             // FanCarouselImageSlider(
      //             //   imagesLink: snapshot.data.productVariations,
      //             //   isAssets: false,
      //             //   autoPlay: true,
      //             // ),
      //           ],
      //         ),
      //       );
      //     }
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
        );
  }
}
