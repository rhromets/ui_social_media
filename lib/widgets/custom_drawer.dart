import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/screens/home_screen.dart';
import 'package:social_media_ui/screens/login_screen.dart';
import 'package:social_media_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  _buildDrawerOption(Icon icon, String title, void Function() tapHandler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20.0),
      ),
      onTap: tapHandler,
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
                height: 200.0,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl!),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 200.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProfileScreen(
                              user: currentUser,
                            ),
                          ),
                        ),
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 3.0,
                                color: Theme.of(context).primaryColor),
                          ),
                          child: ClipOval(
                            child: Image(
                              image: AssetImage(currentUser.profileImageUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        currentUser.name.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            const Icon(Icons.dashboard),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(const Icon(Icons.chat), 'Chat', () {}),
          _buildDrawerOption(const Icon(Icons.location_on), 'Map', () {}),
          _buildDrawerOption(
            const Icon(Icons.account_circle),
            'Your Profile',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(
                  user: currentUser,
                ),
              ),
            ),
          ),
          _buildDrawerOption(const Icon(Icons.settings), 'Settings', () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                const Icon(Icons.directions_run),
                'Logout',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
