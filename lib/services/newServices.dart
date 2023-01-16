

import 'package:dio/dio.dart';
import 'package:newsapp/api.dart';
import 'package:newsapp/model/news.dart';

class NewsServices{


  static  Future<List<News>> getNewsQuery(String $query)async{

    final dio= Dio();
    try{
      final response= await Dio().get(NewsApi.baseUrl,
          queryParameters: {
            'q':$query,
            'lang':'en'
          },
          options: Options(
              headers: {
                'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
                'X-RapidAPI-Key':'955e596439msh79be635c922d0f7p19fc5ajsna15889b3dda8',
              }

          )
      );
      if(response.data['status']=='No matches for your search.'){
        return[News(title: 'sorry guys news xoina hoi', link: '', author: '', published_date: '', media: '')];


      }
      else{
        final data =(response.data['articles']as List).map((news)=>News.fromJson(news)).toList();

        return data;

      }




    }on DioError catch(err){

      return [];

    }


  }

  static  Future<List<News>?> getDefaultNews()async{

    final dio= Dio();
    try{
     // await Future.delayed(Duration(seconds: 2));
      final response= await Dio().get(NewsApi.baseUrl,
      queryParameters: {
        'q':'Nepal',
         'lang':'en'
      },
      options: Options(
        headers: {
          'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
          'X-RapidAPI-Key':'955e596439msh79be635c922d0f7p19fc5ajsna15889b3dda8',
        }

      )
      );

       final data =(response.data['articles']as List).map((news) => News.fromJson(news)).toList();
       return data;


    }on DioError catch(err){
      return[];

    }


  }


}