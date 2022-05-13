import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductServices{
  
  String baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse('$baseUrl/products');
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var response = await http.get(url, headers: headers);
    
    print(response.body);

    if(response.statusCode == 200){
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    }else{
      throw Exception("Gagal Get Products!");
    }
  }  

}