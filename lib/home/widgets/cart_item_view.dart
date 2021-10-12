import 'package:flutter/material.dart';
import 'package:shopping_app/home/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/home/providers/cart_provider.dart';

class CartItemView extends StatelessWidget {
  final ProductModel productModel;
  int itemCount = 0;

  CartItemView(this.productModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2021/07/giay-the-thao-puma-rs-fast-running-system-white-black-men-casual-shoes-380562-03-mau-trang-den-610200e316e76-29072021081411.jpg',
          width: 80,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Shopping Cart'),
            ),
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.chevron_left),
                    onPressed: () {
                      context
                          .read<CartProvider>()
                          .removeItemFromCart(productModel);
                    }),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(context.watch<CartProvider>().currentProduct.count.toString()),
                ),
                IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      context.read<CartProvider>().addItemToCart(productModel);
                    }),
              ],
            )
          ],
        ),
        Spacer(),
        // Text('\$${cartItem.cost}'),
        Text('\$1000'),
      ],
    );
  }
}
