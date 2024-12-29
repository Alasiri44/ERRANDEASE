import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About ErrandEase'),
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Column(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 60,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'ErrandEase',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Simplifying life, one errand at a time',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, 'Our Mission'),
                  _buildSectionContent(
                    'ErrandEase is a comprehensive platform designed to simplify life by enabling users to request a wide range of services from the comfort of their homes. From household chores to personal care and event planning, we connect you with trusted professionals.',
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, 'Our Services'),
                  _buildServicesList(),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, 'Why Choose Us'),
                  _buildFeatureGrid(),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, 'Technical Excellence'),
                  _buildTechStack(),
                  const SizedBox(height: 32),
                  _buildContactSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(fontSize: 16, height: 1.5),
    );
  }

  Widget _buildServicesList() {
    final services = [
      'House Cleaning',
      'Chauffeur Services',
      'Event Organization',
      'Handyman Services',
      'Personal Shopping',
      'Babysitting',
      'Salon Services',
      'Professional Chefs',
      'Pet Care',
      'Personal Assistance',
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: services.map((service) {
        return Chip(
          label: Text(service),
          backgroundColor: Colors.grey[200],
        );
      }).toList(),
    );
  }

  Widget _buildFeatureGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        _buildFeatureCard(Icons.security, 'Secure Platform'),
        _buildFeatureCard(Icons.access_time, 'Real-time Tracking'),
        _buildFeatureCard(Icons.star, 'Verified Professionals'),
        _buildFeatureCard(Icons.payment, 'Secure Payments'),
      ],
    );
  }

  Widget _buildFeatureCard(IconData icon, String title) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechStack() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Built with cutting-edge technologies:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTechChip('Flutter'),
                _buildTechChip('Node.js'),
                _buildTechChip('MySQL'),
                _buildTechChip('Firebase'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue[100],
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Add contact action
              },
              icon: const Icon(Icons.email),
              label: const Text('Contact Support'),
            ),
          ],
        ),
      ),
    );
  }
}
