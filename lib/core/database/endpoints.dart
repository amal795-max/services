class EndPoints{
  static const String baseUrl = "https://jsonplaceholder.typicode.com/";
  static const String addAndGet = "posts/";

  static String deleteAndUpdatePost(id){
    return "https://jsonplaceholder.typicode.com/posts/$id";}
}

class ApiKeys{
  static String id='id';
  static String title='title';
  static String body='body';

  //auth
  static String name='name';
  static String email='email';
  static String password='password';
  static String password_confirmation='password_confirmation';
  static String role='role';
}