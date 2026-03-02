import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Main card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withOpacity(0.15)),
            ),
            child: Column(
              children: [
                Text(
                  weather.city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  weather.description.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white60,
                    letterSpacing: 1.5,
                    fontSize: 12,
                  ),
                ),
                Image.network(weather.iconUrl, width: 100, height: 100),
                Text(
                  '${weather.temperature.round()}°C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  'Feels like ${weather.feelsLike.round()}°C',
                  style: const TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Details row
          Row(
            children: [
              _DetailTile(icon: Icons.water_drop, label: 'Humidity', value: '${weather.humidity}%'),
              const SizedBox(width: 12),
              _DetailTile(icon: Icons.air, label: 'Wind', value: '${weather.windSpeed} m/s'),
              const SizedBox(width: 12),
              _DetailTile(
                icon: Icons.thermostat,
                label: 'Range',
                value: '${weather.tempMin.round()}° / ${weather.tempMax.round()}°',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailTile({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white70, size: 22),
            const SizedBox(height: 6),
            Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
            Text(label, style: const TextStyle(color: Colors.white38, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
