import 'package:atividade/main_screen.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  final Product? product;

  AddProductScreen({this.product});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      nameController.text = widget.product!.nome;
      priceController.text = widget.product!.preco.toString();
      quantity = widget.product!.quantidade;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.product == null ? 'Adicionar Produto' : 'Editar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome do Produto'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                quantity = int.tryParse(value) ?? 1;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newProduct = Product(
                  id: widget.product?.id ??
                      DateTime.now().millisecondsSinceEpoch,
                  nome: nameController.text,
                  preco: double.parse(priceController.text),
                  quantidade: quantity,
                );
                Navigator.pop(context, newProduct);
              },
              child: Text(widget.product == null ? 'Adicionar' : 'Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
