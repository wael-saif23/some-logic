import 'package:flutter/material.dart';
import 'package:some_logic/core/models/product_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ProductModel> products = [
    ProductModel(
      id: "1",
      title: "Clothes hanger",
      image: "assets/carvel_products/Clothes_hanger.jpg",
      price: 100,
      category: "Tools",
    ),
    ProductModel(
      id: "2",
      title: "Face image",
      image: "assets/carvel_products/Face_image.jpg",
      price: 130,
      category: "Decor",
    ),
    ProductModel(
      id: "3",
      title: "Flower key hanger",
      image: "assets/carvel_products/Flower_key_hanger.jpg",
      price: 110,
      category: "Key Holders",
    ),
    ProductModel(
      id: "4",
      title: "Key hanger",
      image: "assets/carvel_products/Key_hanger.jpg",
      price: 95,
      category: "Key Holders",
    ),
    ProductModel(
      id: "5",
      title: "Name",
      image: "assets/carvel_products/name.jpg",
      price: 90,
      category: "Decor",
    ),
    ProductModel(
      id: "6",
      title: "Name with flowers",
      image: "assets/carvel_products/Name_with_flowers.jpg",
      price: 140,
      category: "Decor",
    ),
    ProductModel(
      id: "7",
      title: "Prayer corner",
      image: "assets/carvel_products/Prayer_corner.jpg",
      price: 160,
      category: "Religious",
    ),
    ProductModel(
      id: "8",
      title: "Wooden bindings",
      image: "assets/carvel_products/Wooden_bindings.jpg",
      price: 125,
      category: "Accessories",
    ),
    ProductModel(
      id: "9",
      title: "Wooden leaf",
      image: "assets/carvel_products/Wooden_leaf.jpg",
      price: 105,
      category: "Decor",
    ),
  ];
  List<ProductModel> filteredProducts = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    filteredProducts = List<ProductModel>.from(products);
    super.initState();
  }

  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = products;
      } else {
        filteredProducts =
            products.where((product) {
              return product.title.toLowerCase().contains(query.toLowerCase());
            }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  // Search bar
                  child: TextField(
                    controller: searchController,
                    onChanged: filterProducts,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                      // Clear button
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear, color: Colors.red[600]),
                        onPressed: () {
                          setState(() {
                            filteredProducts = products;
                            searchController.clear();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Category filter buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    children: [
                      categoryButton(category: "All"),
                      categoryButton(category: "Tools"),
                      categoryButton(category: "Decor"),
                      categoryButton(category: "Key Holders"),
                      categoryButton(category: "Religious"),
                      categoryButton(category: "Accessories"),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    // popup filter
                    PopupMenuButton(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.filter_list, color: Colors.green),
                            SizedBox(width: 5),
                            Text(
                              'Filter',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      itemBuilder: (context) {
                        return [
                          // filter by name
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.sort_by_alpha, color: Colors.green),
                                SizedBox(width: 5),
                                Text(
                                  'Filter by Name',
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                if (filteredProducts.isEmpty) return;
                                if (filteredProducts.length < 2) return;
                                filteredProducts.sort((a, b) {
                                  return a.title.compareTo(b.title);
                                });
                              });
                            },
                          ),
                          // filter by price
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.price_change, color: Colors.green),
                                SizedBox(width: 5),
                                Text(
                                  'Filter by Price',
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                if (filteredProducts.isEmpty) return;
                                if (filteredProducts.length < 2) return;
                                filteredProducts.sort((a, b) {
                                  a.price ??= 0;
                                  b.price ??= 0;
                                  return a.price!.compareTo(b.price!);
                                });
                              });
                            },
                          ),
                        ];
                      },
                    ),
                    Spacer(),
                    // Reset filters
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          filteredProducts = List<ProductModel>.from(products);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Reset Filters',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Displaying filtered products
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Image.asset(
                            product.image,
                            fit: BoxFit.fill,
                            width: 50,
                            height: 50,
                          ),
                          title: Text(
                            product.title,
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            '\$${product.price}',
                            style: TextStyle(color: Colors.green),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            // Navigate to product details
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton categoryButton({required String category}) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (category == "All") {
            filteredProducts = products;
            return;
          }
          filteredProducts =
              products
                  .where((product) => product.category == category)
                  .toList();
        });
      },
      child: Text(category),
    );
  }
}
