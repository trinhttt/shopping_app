import 'package:flutter/material.dart';
import 'package:shopping_app/home/widgets/product_item_view.dart';
import 'cart_screen.dart';
import 'models/product_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> productList = [];

  @override
  void initState() {
    super.initState();
    productList = List.generate(
        10,
        (index) => ProductModel(
            index,
            "https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2021/07/giay-the-thao-puma-rs-fast-running-system-white-black-men-casual-shoes-380562-03-mau-trang-den-610200e316e76-29072021081411.jpg",
            "Product $index",
            "Brand $index",
            index * 100,
            0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
              shrinkWrap: true,
              children: List.generate(15, (index) {
                return index == 15
                    ? SizedBox(height: 60)
                    : ListTile(title: Text('Item $index'));
              })),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Sneex',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () {
          //     print('Tapped menu');
          //   },
          //   icon: Icon(Icons.menu, color: Colors.black)
          // ),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return CartScreen();
                      });
                },
                icon: Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.black,
                )),
          ],
        ),
        body: Container(
            margin: EdgeInsets.all(5),
            child: GridView.builder(
                itemCount: productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    mainAxisExtent: 275),
                itemBuilder: (context, index) {
                  return ProductItemView(productList[index]);
                })));
  }
}
