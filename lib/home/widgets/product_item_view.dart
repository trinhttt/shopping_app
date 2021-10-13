import 'package:flutter/material.dart';
import 'package:shopping_app/home/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/home/providers/cart_provider.dart';

class ProductItemView extends StatelessWidget {
  final ProductModel productModel;

  ProductItemView(this.productModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Tapped product');
      },
      child: Container(
        margin: EdgeInsets.all(5), // to show shadow
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 2,
                spreadRadius: 2,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(productModel.imageUrl),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 4),
            Text(productModel.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            // SizedBox(height: 4),
            Text(productModel.brand,
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 4),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Text("\$${productModel.price}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      context.read<CartProvider>().addItemToCart(productModel);
                    },
                    icon: Icon(Icons.add_shopping_cart),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
