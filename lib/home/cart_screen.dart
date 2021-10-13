import 'package:flutter/material.dart';
import 'package:shopping_app/home/providers/cart_provider.dart';
import 'package:shopping_app/home/widgets/cart_item_view.dart';
import 'models/product_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<CartProvider>(context);

    return Stack(
      children: [
        SizedBox(height: 15),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 10),
          child: Text('Shopping Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView(
            children: [
              SizedBox(height: 5),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children:
                        // context.watch<CartProvider>().productList.map((item) => CartItemView(item)).toList(),
                    cartProvider.productList.map((item) => CartItemView(item)).toList(),
                  )),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                fixedSize: Size(MediaQuery.of(context).size.width - 30, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () {},
            child: Text("10000"),
          ),
        )
      ],
    );
  }
}
