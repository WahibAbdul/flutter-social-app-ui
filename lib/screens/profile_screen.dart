import 'package:flutter/material.dart';
import 'package:social_media_ui/models/user_model.dart';
import 'package:social_media_ui/widgets/custom_drawer.dart';
import 'package:social_media_ui/widgets/posts_carousel.dart';
import 'package:social_media_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  _ProfileScreenState createState() => new _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final PageController _pageController;
  late final PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritesPageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    image: AssetImage(widget.user.backgroundImageUrl!),
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 20.0,
                  top: 50.0,
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    color: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                ),
                Positioned(
                    bottom: 10.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.user.profileImageUrl!),
                          width: 120.0,
                          height: 120.0,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.user.name!,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 1.5),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Following',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black54),
                    ),
                    Text(
                      widget.user.following.toString(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black54),
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            PostsCarousel(pageController: _pageController, title: 'Posts', posts: widget.user.posts!),
            PostsCarousel(pageController: _favoritesPageController, title: 'Favorites', posts: widget.user.favorites!),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
