import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slashtraining/features/product_details/data/models/data_map.dart';
import 'package:slashtraining/features/product_details/data/repo/details_repo.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen(
      {super.key,
      required this.id,
      required this.mainImage,
      required this.mainPrice});

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
                List<String> fullImages= [];
                if (snapshot.data.data.variations[0].productVarientImagesDetails
                        .length ==
                    1) {
                  fullImages = [
                    widget.mainImage,
                    snapshot.data.data.variations[0]
                        .productVarientImagesDetails[0].image_path,
                  ];
                } else {
                  for(int i =0 ; i <snapshot.data.data.variations[0].productVarientImagesDetails
                      .length ; i++){
                  fullImages.add(snapshot.data.data.variations[0]
                        .productVarientImagesDetails[i].image_path);}
                }
                print(snapshot.data.data.variations[0]
                    .productVarientImagesDetails.length);
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
                            "EGP${widget.mainPrice}",
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
                      ListView.builder(
                          shrinkWrap: true,
                          controller: controller,
                          itemCount:
                              snapshot.data.data.avaiableProperties.length,
                          itemBuilder: (context, index) {
                            String selectedType = snapshot
                                .data.data.avaiableProperties[index].property;
                            //print(HexColor.fromHex("00A1A4"));
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Select $selectedType",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Center(
                                  child: selectedType == "Color"
                                      ? Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: Color(HexColor.fromHex(
                                                  snapshot
                                                      .data
                                                      .data
                                                      .avaiableProperties[index]
                                                      .values[0]
                                                      .value)),
                                          borderRadius: BorderRadius.circular(30),
                                            border: Border.all(color: Colors.white , width: 3)
                                          ),
                                        )
                                      : Text(
                                          snapshot
                                              .data
                                              .data
                                              .avaiableProperties[index]
                                              .values[0]
                                              .value,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            );
                          }),
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
