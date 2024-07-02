import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/controller/details_controller.dart';
import 'package:movie_app_project/controller/images_controller.dart';
import 'package:movie_app_project/entity/media/movie/movie.dart';
import 'package:movie_app_project/pages/widgets/appbar/details/movie_app_bar.dart';
import 'package:movie_app_project/pages/widgets/reviews_button.dart';
import 'package:tmdb_api/tmdb_api.dart';

class BrowseDetailsMovie extends StatelessWidget {
  BrowseDetailsMovie({super.key, required this.movie});

  final Movie movie;
  final DetailsController _detailController = Get.find<DetailsController>();
  final ImagesController _imagesController = Get.find<ImagesController>();

  @override
  Widget build(BuildContext context) {
    _imagesController.getMovieImages(movie.id);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            MovieAppBar(movie: movie),
            SliverToBoxAdapter(
              child: Obx(
                () => _detailController.isLoading
                    ? const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                movie.title,
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                              width: double.infinity,
                            ),
                            Center(
                              child: Text(
                                _detailController.currentMovieDetails.tagline,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                              width: double.infinity,
                            ),
                            movie.overview.isEmpty
                                ? const Text('No overview available')
                                : Text(movie.overview,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    )),
                            const SizedBox(
                              height: 22,
                              width: double.infinity,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Row(children: [
                                    const Icon(Icons.watch_later),
                                    const SizedBox(width: 5),
                                    Text(
                                        '${_detailController.currentMovieDetails.runtime} min'),
                                  ]),
                                  Row(children: [
                                    const Icon(Icons.calendar_month_outlined),
                                    const SizedBox(width: 5),
                                    Text(movie.releaseDate),
                                  ]),
                                  Row(children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                        '${movie.voteAverage.toStringAsFixed(1)}/10 (${_detailController.currentMovieDetails.voteCount})'),
                                  ]),
                                  Row(children: [
                                    const Text('Language: '),
                                    const SizedBox(width: 5),
                                    Text(movie.originalLanguage)
                                  ])
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Produced by',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Wrap(
                                    direction: Axis.vertical,
                                    children: _detailController
                                        .currentMovieDetails.productionCompanies
                                        .map((company) => Text(company.name))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            _imagesController.isLoading
                                ? const CircularProgressIndicator()
                                : _imagesController.movieImages.isEmpty
                                    ? const Text('No images found')
                                    : CarouselSlider.builder(
                                        options: CarouselOptions(
                                          enableInfiniteScroll: false,
                                          enlargeCenterPage: true,
                                          viewportFraction: 0.6,
                                          autoPlay: true,
                                        ),
                                        itemCount: _imagesController
                                            .movieImages.length,
                                        itemBuilder: (BuildContext context,
                                            int index, int realIndex) {
                                          final image = _imagesController
                                              .movieImages[index];
                                          return GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    insetPadding:
                                                        const EdgeInsets.all(5),
                                                    child: Image.network(
                                                      'https://image.tmdb.org/t/p/w500${image.filePath}',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                'https://image.tmdb.org/t/p/w500${image.filePath}',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                            ReviewsButton(
                                mediaId: movie.id,
                                mediaType: MediaType.movie,
                                title: movie.title),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
