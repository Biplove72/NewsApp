
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/model/news.dart';
import 'package:newsapp/services/newServices.dart';


final searchNewsProvider =StateNotifierProvider<SearchNewsProvider,List<News>>((ref) => SearchNewsProvider());
class SearchNewsProvider extends StateNotifier<List<News>>{
  SearchNewsProvider():super([]){
    getData();
  }
  Future<void>getData() async{

  await Future.delayed(Duration(seconds:7));
    final response = await NewsServices.getDefaultNews();
    state=response!;
}
  Future<void> getQuery(String query)async{
    state=[];
    final response = await NewsServices.getNewsQuery(query);
    state=response;


  }




}