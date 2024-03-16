import 'package:flutter/material.dart';
import 'package:slashtraining/features/home/data/models/product_model.dart';
import '../../../product_details/presentation/screens/products_details_screen.dart';
import '../../data/repo/home_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0C0C0C),
        appBar: AppBar(
          backgroundColor: const Color(0xff0C0C0C),
          centerTitle: true,
          title: const Text(
            "Slash.",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FutureBuilder<ProductModel>(
                    future: HomeRepo().getProducts(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(
                            child: Text(
                          snapshot.error.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ));
                      }
                      if (snapshot.hasData) {
                        return GridView.builder(
                            itemCount: snapshot.data.data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:
                                  (MediaQuery.sizeOf(context).width * 0.4) /
                                      220,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 150,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          color: Colors.white),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductsDetailsScreen(
                                                        id: snapshot.data
                                                            .data[index].id,
                                                        mainImage: snapshot
                                                            .data
                                                            .data[index]
                                                            .productVariations[
                                                                0]
                                                            .productVarientImages[
                                                                0]
                                                            .image_path,
                                                        mainPrice: snapshot
                                                            .data
                                                            .data[index]
                                                            .productVariations[
                                                                0]
                                                            .price,
                                                      )));
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.network(
                                            "${snapshot.data.data[index].productVariations[0].productVarientImages[0].image_path}",
                                            errorBuilder: (context, exception,
                                                stackTrace) {
                                              return const Text(
                                                '/.',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              );
                                            },
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              snapshot.data.data[index].name,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                color: Colors.black),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: snapshot
                                                          .data
                                                          .data[index]
                                                          .brand
                                                          .brand_logo_image_path !=
                                                      null
                                                  ? Center(
                                                      child: Image.network(
                                                        "${snapshot.data.data[index].brand.brand_logo_image_path}",
                                                        errorBuilder: (context,
                                                            exception,
                                                            stackTrace) {
                                                          return const Text(
                                                            '/.',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .white),
                                                          );
                                                        },
                                                        fit: BoxFit.fill,
                                                      ),
                                                    )
                                                  : const Text(
                                                      "/.",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "EGP ${snapshot.data.data[index].productVariations[0].price}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.favorite_border_rounded,
                                              color: Colors.white,
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            });
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
