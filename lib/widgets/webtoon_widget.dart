import 'package:flutter/material.dart';
import 'package:toonflix/screen/detail.screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  const BoxShadow(
                    blurRadius: 7,
                    offset: Offset(0, 5),
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ],
              ),
              child: Image.network(
                thumb,
                headers: const {
                  'User-Agent': 'Mozilla/5.0',
                  'Referer': 'https://comic.naver.com',
                },
                errorBuilder: (context, err, st) =>
                    const Icon(Icons.broken_image),
                loadingBuilder: (context, child, progress) => progress == null
                    ? child
                    : const CircularProgressIndicator(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
