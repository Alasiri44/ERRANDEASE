import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

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