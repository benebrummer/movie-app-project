import 'package:flutter/material.dart';
import 'package:movie_app_project/entity/media/production_company.dart';
import 'package:movie_app_project/pages/search/widgets/details/details_header.dart';
import 'package:tmdb_api/tmdb_api.dart';

class DetailsCard extends StatelessWidget {
  final String title;
  // TODO: maybe remove SearchCategory and replace with MediaType
  final MediaType mediaType;
  final String overview;
  final Widget statsWidget;
  final List<ProductionCompany> producerCompanies;
  final String posterPath;
  final String tagline;
  const DetailsCard({
    super.key,
    required this.title,
    required this.mediaType,
    required this.overview,
    required this.statsWidget,
    required this.producerCompanies,
    required this.posterPath,
    required this.tagline,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              DetailsHeaderWidget(
                posterPath: posterPath,
                title: title,
                tagline: tagline,
              ),
              const SizedBox(height: 20),
              const Divider(),
              Text(
                overview,
                style: const TextStyle(fontSize: 16),
              ),
              const Divider(),
              const SizedBox(height: 20),
              statsWidget,
              const SizedBox(height: 20),
              const Divider(),
              const Row(
                children: [
                  Text(
                    'Produced by:',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: producerCompanies.length * 20,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: producerCompanies.length,
                  itemBuilder: (context, index) {
                    return Text(producerCompanies[index].name);
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    // TODO
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite),
                      SizedBox(width: 5),
                      Text('Add to favorites'),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
