import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/screens/home_screen.dart';
import 'package:social_media_ui/screens/login_screen.dart';
import 'package:social_media_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(BuildContext context, Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      onTap: () {
        onTap();
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(currentUser.backgroundImageUrl!),
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 3.0, color: Theme.of(context).primaryColor),
                        ),
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(currentUser.profileImageUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        currentUser.name!,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    ],
                  ))
            ],
          ),
          _buildDrawerOption(
            context,
            const Icon(Icons.dashboard),
            'Home',
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(context, const Icon(Icons.chat), 'Chat', () {}),
          _buildDrawerOption(context, const Icon(Icons.location_on), 'Map', () {}),
          _buildDrawerOption(context, const Icon(Icons.account_circle), 'Your Profile', () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => ProfileScreen(
                  user: currentUser,
                ),
              ),
            );
          }),
          _buildDrawerOption(context, const Icon(Icons.settings), 'Settings', () {}),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: _buildDrawerOption(context, const Icon(Icons.directions_run), 'Logout', () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => LoginScreen(),
                ),
              );
            }),
          ))
        ],
      ),
    );
  }
}
