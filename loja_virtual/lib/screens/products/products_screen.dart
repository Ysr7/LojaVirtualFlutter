import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/models/product_manager.dart';
import 'package:provider/provider.dart';
import 'components/product_list_tile.dart';
import 'components/search_dialog.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          "Produtos",
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                final search = await showDialog<String>(
                    context: context, builder: (_) => SearchDialog());
                if (search != null) {
                  context.read<ProductManager>().search = search;
                }
              })
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          final filteredProducts = productManager.filteredProducts;
          return ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: productManager.filteredProducts.length,
              itemBuilder: (_, index) {
                return ProdutcListTile(productManager.filteredProducts[index]);
              });
        },
      ),
    );
  }
}
