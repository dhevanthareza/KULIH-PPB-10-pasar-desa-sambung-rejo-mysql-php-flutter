import 'package:flutter/material.dart';
import 'package:pasar_desa_sambungrejo_flutter/api/client.dart';
import 'package:pasar_desa_sambungrejo_flutter/component/loading.dart';
import 'package:pasar_desa_sambungrejo_flutter/config.dart';
import 'package:pasar_desa_sambungrejo_flutter/model/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<ProductModel> products = [];
  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  fetchProduct() async {
    List<dynamic> response = await Request.get('/api/get_barang.php');
    print(response);
    setState(() {
      products = response.map((e) => ProductModel.fromJson(e)).toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pasar Desa Sambung Rejo"),
      ),
      body: isLoading
          ? Center(child: Loading())
          : GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.3,
              children: products
                  .map((ProductModel product) => _productItem(product))
                  .toList(),
            ),
    );
  }

  Widget _productItem(ProductModel product) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                        "${AppConfig.gateway}/api/images/${product.kdBrg}.jpg")
                    .image,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${product.nmBrg}"),
                Text("${product.harga}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
