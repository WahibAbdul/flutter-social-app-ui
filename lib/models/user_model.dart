import 'post_model.dart';

class User {
  String? profileImageUrl;
  String? backgroundImageUrl;
  String? name;
  int? following;
  int? followers;
  List<Post>? posts;
  List<Post>? favorites;

  User({
    this.profileImageUrl,
    this.backgroundImageUrl,
    this.name,
    this.following,
    this.followers,
    this.posts,
    this.favorites,
  });
}
