import 'package:book_app/main.dart';
import 'package:book_app/models/model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void_removeFromCart(Book book) {
    setState(() {
      cart.remove(book);
    });
  }

  void _clearCart() {
    setState(() {
      cart.clear();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(
          icon: Icon(Icons.clear),
          onPressed: _clearCart,
          )
        ],
      ),
      body: cart.isEmpty
          ? Center(child: Text('Cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final book = cart[index];
                      return ListTile(
                        leading: Image.asset(book.imageURL),
                        title: Text(book.title),
                        subtitle: Text("\$" + book.price),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            void_removeFromCart(cart[index]);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                padding: EdgeInsets.all(8),
// child: ElevatedButton(
//               // onPressed: () {
//               //   Navigator.push(
//               //     context,
//               //     MaterialPageRoute(
//               //       builder: (context) => PaymentPage(onPaymentSuccess: _clearCart),
//               //     ),
//               //   );
//               // },
//               child: Text("Pay Now"),
//             ),
          ),
        ],
      ),
    );
  }
}