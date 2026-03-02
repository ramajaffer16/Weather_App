import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D47A1), Color(0xFF1A237E)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Weather',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const SearchBarWidget(),
                const SizedBox(height: 24),
                Expanded(child: _buildBody()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<WeatherProvider>(
      builder: (context, provider, _) {
        switch (provider.status) {
          case WeatherStatus.initial:
            return const Center(
              child: Text(
                'Search for a city to get started',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            );
          case WeatherStatus.loading:
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          case WeatherStatus.loaded:
            return WeatherCard(weather: provider.weather!);
          case WeatherStatus.error:
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.cloud_off, color: Colors.white54, size: 48),
                  const SizedBox(height: 12),
                  Text(
                    provider.errorMessage,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
