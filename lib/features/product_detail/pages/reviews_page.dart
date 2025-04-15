import 'package:flutter/material.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  Widget buildStarRow(int count) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
                (index) => Icon(
              index < count ? Icons.star : Icons.star_border,
              color: Colors.orange,
              size: 20,
            ),
          ),
        ),
         SizedBox(width: 12),
        Stack(
          children: [
            Container(
              height: 8,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              height: 8,
              width: 100 * (count / 5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> reviews = [
      {
        'name': 'Wade Warren',
        'comment': 'The item is very good, my son likes it very much and plays every day.',
        'time': '2 weeks ago'
      },
      {
        'name': 'Guy Hawkins',
        'comment': 'The delivery was fast in sending packet, I just bought it and the item arrived in just 1 day!',
        'time': '2 weeks ago'
      },
      {
        'name': 'Robert Fox',
        'comment': 'I bought it and the stuff is really good! I highly recommend it!',
        'time': '2 weeks ago'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        centerTitle: true,
        leading: const BackButton(),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
               Text('4.0', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
               SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(4, (_) => const Icon(Icons.star, color: Colors.orange, size: 20))
                      ..add(const Icon(Icons.star_border, color: Colors.orange, size: 20)),
                  ),
                   Text('1034 Ratings', style: TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
           SizedBox(height: 28),
          buildStarRow(5),
           SizedBox(height: 10),
          buildStarRow(4),
           SizedBox(height: 10),
          buildStarRow(3),
           SizedBox(height: 10),
          buildStarRow(2),
           SizedBox(height: 10),
          buildStarRow(1),

           SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('45 Reviews', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Most Relevant', style: TextStyle(color: Colors.grey)),
            ],
          ),
           SizedBox(height: 20),
          ...reviews.map((r) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    Icon(Icons.star_border, size: 16, color: Colors.orange),
                  ],
                ),
                 SizedBox(height: 10),
                Text(r['comment']!, style: const TextStyle(fontSize: 15)),
                 SizedBox(height: 4),
                Text('${r['name']} • ${r['time']}', style: const TextStyle(color: Colors.grey)),
              ],
            ),
          )),
        ],
      ),
    );
  }
}


