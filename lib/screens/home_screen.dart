import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/widgets/custom_drawer.dart';
import 'package:social_media_ui/widgets/following_users.dart';
import 'package:social_media_ui/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Text(
          'FRENZY',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).primaryColor,
                letterSpacing: 1.0,
              ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: Theme.of(context).textTheme.titleMedium,
          indicatorWeight: 3.0,
          tabs: const [
            Tab(text: 'Trending'),
            Tab(text: 'Latest'),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: [
        FollowingUsers(users: users),
        PostsCarousel(
          pageController: _pageController,
          title: 'Posts',
          posts: posts,
        ),
      ],
    );
  }
}
