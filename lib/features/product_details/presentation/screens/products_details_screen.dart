import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slashtraining/features/product_details/data/models/data_map.dart';
import 'package:slashtraining/features/product_details/data/repo/details_repo.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({
    super.key,
    required this.id,
    required this.mainImage,
    required this.mainPrice,
  });

  final int id;
  final String mainImage;
  final int mainPrice;

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  ScrollController? controller = ScrollController();


  @override
  Widget build(BuildContext context) {
    int price = widget.mainPrice;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff0C0C0C),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            )),
        title: const Text(
          "Product details",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.vertical,
          child: FutureBuilder<DataMap>(
            future: DetailsRepo().getProductDetails(widget.id),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                    child: Text(
                  snapshot.error.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ));
              }
              if (snapshot.hasData) {

                List<String> fullImages = [];
                List<int> pricesVarity = [];
                List<int> variableId = [];
                if (snapshot.data.data.variations[0].productVarientImagesDetails
                        .length ==
                    1) {
                  fullImages = [
                    widget.mainImage,
                    snapshot.data.data.variations[0]
                        .productVarientImagesDetails[0].image_path,
                  ];
                } else {
                  for (int i = 0;
                      i <
                          snapshot.data.data.variations[0].productVarientImagesDetails.length;
                      i++) {
                      fullImages.add(snapshot.data.data.variations[0]
                          .productVarientImagesDetails[i].image_path);

                    }
                }
                print(snapshot.data.data.variations[0]
                    .productVarientImagesDetails.length);

                print(widget.id);
                for(int index = 0 ; index< snapshot.data.data.variations.length; index ++){
                  variableId.add(snapshot.data.data.variations[index].id);
                  pricesVarity.add(snapshot.data.data.variations[index].price);
                }
                print(variableId);
                print(pricesVarity);
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FanCarouselImageSlider(
                        indicatorActiveColor: Colors.white,
                        imageFitMode: BoxFit.fill,
                        sliderHeight: 350,
                        imagesLink: fullImages,
                        isAssets: false,
                        autoPlay: false,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snapshot.data.data.name,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.black),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Center(
                                child: Image.network(
                                  "${snapshot.data.data.brandImage}",
                                  errorBuilder:
                                      (context, exception, stackTrace) {
                                    return const Text(
                                      '/.',
                                      style: TextStyle(
                                          fontSize: 40, color: Colors.white),
                                    );
                                  },
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EGP$price",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            snapshot.data.data.brandName,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount:snapshot.data.data.avaiableProperties[0].values.length ,
                      //   itemBuilder: (BuildContext context, int index) {
                      //   return Row(
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Text(snapshot.data.data.avaiableProperties[0].values[index].value.toString()??""),
                      //           Text(snapshot.data.data.avaiableProperties[1].values[index].value.toString()??""),
                      //         ],
                      //       ),
                      //     ],
                      //   );
                      // },
                      // ),
                      Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                                snapshot.data.data.avaiableProperties
                                        ?.map<Widget>((property) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${property.property}',
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: property.values
                                                      ?.map<Widget>(
                                                          (value) => Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(5),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .green,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: property.property == "Color"? Container(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(HexColor.fromHex(value.value)),
                                                                            borderRadius: BorderRadius.circular(50),
                                                                            border: Border.all(color: Colors.white, width: 3)),
                                                                      )
                                                                    : TextButton(
                                                                        child:
                                                                            Text(
                                                                          '${value.value}',
                                                                          style: const TextStyle(
                                                                              fontSize: 18,
                                                                              color: Colors.white),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          int newId = value.id;
                                                                          print(newId);
                                                                            },
                                                                      ),
                                                              ))
                                                      .toList() ??
                                                  [],
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList() ??
                                    [],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        snapshot.data.data.description,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HexColor {
  static fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return int.parse(buffer.toString(), radix: 16);
  }
}