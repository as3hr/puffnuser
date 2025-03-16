import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    final historyData = [
      {
        "title": "One Week Ago",
        "rides": [
          {"id": "1250", "time": "08:30", "date": "Jan 20", "price": 200},
          {"id": "1245", "time": "14:00", "date": "Jan 18", "price": 175},
        ],
      },
      {
        "title": "One Month Ago",
        "rides": [
          {"id": "1200", "time": "10:15", "date": "Dec 25", "price": 220},
          {"id": "1180", "time": "16:45", "date": "Dec 12", "price": 180},
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Ride History", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF122981),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: historyData.length,
        itemBuilder: (context, index) {
          final section = historyData[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  section["title"].toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                elevation: 3,
                child: Column(
                  children: (section["rides"] as List).map((ride) {
                    return Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.directions_car,
                              size: 30, color: Color(0xFF122981)),
                          title: Text(
                            "Ride #${ride['id']}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text("${ride['date']}, ${ride['time']}"),
                          trailing: Text(
                            "\$${ride['price']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Divider(height: 1),
                      ],
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
