
class News{

final String title;
final String author;
final String published_date;
final String link;
final String media;
News({required this.title,required this.link,required this.author,
  required this.published_date,required this.media

});

factory News.fromJson(Map<String,dynamic>json){
  
  return News(
      title: json['title']??'',
      link: json['link']??'',
      author: json['author']??'',
      published_date: json['published_date']??'',
      media: json['media']??''
  );
}

}