import 'package:flutter/material.dart';

void main() {
  runApp(ErrandEaseApp());
}

class ErrandEaseApp extends StatefulWidget {
  @override
  _ErrandEaseAppState createState() => _ErrandEaseAppState();
}

class _ErrandEaseAppState extends State<ErrandEaseApp> {
  ThemeData _currentTheme = ThemeData.light();

  void _toggleTheme() {
    setState(() {
      _currentTheme = _currentTheme == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ErrandEase',
      theme: _currentTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(toggleTheme: _toggleTheme),
        '/about': (context) => AboutPage(),
        '/services': (context) => ServicesPage(),
        '/contact': (context) => ContactPage(),
        '/settings': (context) => SettingsPage(toggleTheme: _toggleTheme),
        '/requestService': (context) => RequestServicePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme;

  HomePage({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ErrandEase'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to ErrandEase!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/services');
              },
              child: Text('Explore Services'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About ErrandEase',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'ErrandEase is a platform dedicated to simplifying your daily tasks. We connect you with trusted service providers to handle your errands efficiently.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Services'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ServiceCard(
              icon: Icons.shopping_cart,
              title: 'Shopping Assistance',
              description: 'Get your shopping done with ease and convenience.',
              onTap: () {
                Navigator.pushNamed(context, '/requestService', arguments: 'Shopping Assistance');
              },
            ),
            ServiceCard(
              icon: Icons.local_shipping,
              title: 'Delivery Services',
              description: 'Reliable and timely delivery of packages.',
              onTap: () {
                Navigator.pushNamed(context, '/requestService', arguments: 'Delivery Services');
              },
            ),
            ServiceCard(
              icon: Icons.cleaning_services,
              title: 'Cleaning Services',
              description: 'Professional cleaning services for your home or office.',
              onTap: () {
                Navigator.pushNamed(context, '/requestService', arguments: 'Cleaning Services');
              },
            ),
            ServiceCard(
              icon: Icons.handyman,
              title: 'Handyman Services',
              description: 'Expert help for repairs and maintenance.',
              onTap: () {
                Navigator.pushNamed(context, '/requestService', arguments: 'Handyman Services');
              },
            ),
            ServiceCard(
              icon: Icons.pets,
              title: 'Pet Sitting',
              description: 'Care for your pets while you are away.',
              onTap: () {
                Navigator.pushNamed(context, '/requestService', arguments: 'Pet Sitting');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RequestServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String serviceName = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Request $serviceName'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Request $serviceName',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your details',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle service request submission
              },
              child: Text('Submit Request'),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get in Touch',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Email: support@errandease.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Phone: +123 456 7890',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final VoidCallback toggleTheme;

  SettingsPage({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('Toggle Theme'),
              onTap: toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'ErrandEase Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Our Services'),
            onTap: () {
              Navigator.pushNamed(context, '/services');
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  ServiceCard({required this.icon, required this.title, required this.description, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
