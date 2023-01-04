
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/model/news.dart';
import 'package:newsapp/services/newServices.dart';

final newsProvider =StateNotifierProvider.family<GetQueryNews,List<News>,String>((ref,String query) => GetQueryNews(query: query));

class GetQueryNews extends StateNotifier<List<News>>{

  GetQueryNews({required this.query}):super([]){
    getQuery();
  }
  final String query;
  //future halda bitikoi async ra await use garney

  Future<void> getQuery()async{

    final response = await NewsServices.getNewsQuery(query);
    state=response;


  }
}

