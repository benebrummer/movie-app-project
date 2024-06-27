import 'package:flutter/material.dart';
import 'package:movie_app_project/entity/media/series/tv_series.dart';

class BrowseDetailsSeries extends StatelessWidget {
  const BrowseDetailsSeries({super.key, required this.show});

  final TvSeries show;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            leading: Container(
              height: 70, 
              width: 70, 
              margin: const EdgeInsets.only(
                top: 14,
                left: 14,
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8)
              ),
              child: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(Icons.arrow_back_rounded, color: Colors.black,),
              ),
            ),
            backgroundColor: Colors.grey[700],
            expandedHeight: 350,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                child: Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          'https://image.tmdb.org/t/p/w500${show.backdropPath}'
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(show.name, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800),),
                  const SizedBox(height: 5, width: double.infinity,),
                  const Text('Overview', style: TextStyle(decoration: TextDecoration.underline, fontSize: 30, fontWeight: FontWeight.w500),),
                  Text(show.overview, style: const TextStyle(fontSize: 20,)),
                  const SizedBox(height: 22, width: double.infinity,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text('First Air Date: '),
                            Text(show.firstAirDate),
                          ]
                        ),
                        Row(
                          children: [
                            const Text('Rating: '),
                            const Icon(Icons.star, color: Colors.amber,),
                            Text('${show.voteAverage.toStringAsFixed(1)}/10'),
                          ]
                        ),
                        Row(
                          children: [
                            const Text('Language: '),
                            Text(show.originalLanguage)
                          ]
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}