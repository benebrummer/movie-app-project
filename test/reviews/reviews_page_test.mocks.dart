// Mocks generated by Mockito 5.4.4 from annotations
// in movie_app_project/test/details/reviews_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app_project/api/repository/tmdb_repository.dart' as _i5;
import 'package:movie_app_project/entity/backdrop.dart' as _i10;
import 'package:movie_app_project/entity/media/movie/movie.dart' as _i7;
import 'package:movie_app_project/entity/media/movie/movie_details.dart' as _i3;
import 'package:movie_app_project/entity/media/review/review.dart' as _i8;
import 'package:movie_app_project/entity/media/series/series_details.dart'
    as _i4;
import 'package:movie_app_project/entity/media/series/tv_series.dart' as _i9;
import 'package:tmdb_api/tmdb_api.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTMDB_0 extends _i1.SmartFake implements _i2.TMDB {
  _FakeTMDB_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetails_1 extends _i1.SmartFake implements _i3.MovieDetails {
  _FakeMovieDetails_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSeriesDetails_2 extends _i1.SmartFake implements _i4.SeriesDetails {
  _FakeSeriesDetails_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MediaRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMediaRepository extends _i1.Mock implements _i5.MediaRepository {
  MockMediaRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TMDB get tmdbClient => (super.noSuchMethod(
        Invocation.getter(#tmdbClient),
        returnValue: _FakeTMDB_0(
          this,
          Invocation.getter(#tmdbClient),
        ),
      ) as _i2.TMDB);

  @override
  _i6.Future<Map<dynamic, dynamic>> searchMovie(
    String? query,
    int? page,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovie,
          [
            query,
            page,
          ],
        ),
        returnValue:
            _i6.Future<Map<dynamic, dynamic>>.value(<dynamic, dynamic>{}),
      ) as _i6.Future<Map<dynamic, dynamic>>);

  @override
  _i6.Future<List<_i7.Movie>> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i6.Future<List<_i7.Movie>>.value(<_i7.Movie>[]),
      ) as _i6.Future<List<_i7.Movie>>);

  @override
  _i6.Future<List<_i7.Movie>> getTopRatedMovies() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue: _i6.Future<List<_i7.Movie>>.value(<_i7.Movie>[]),
      ) as _i6.Future<List<_i7.Movie>>);

  @override
  _i6.Future<List<_i7.Movie>> getUpcomingMovies() => (super.noSuchMethod(
        Invocation.method(
          #getUpcomingMovies,
          [],
        ),
        returnValue: _i6.Future<List<_i7.Movie>>.value(<_i7.Movie>[]),
      ) as _i6.Future<List<_i7.Movie>>);

  @override
  _i6.Future<List<_i7.Movie>> getNowPlayingMovies() => (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue: _i6.Future<List<_i7.Movie>>.value(<_i7.Movie>[]),
      ) as _i6.Future<List<_i7.Movie>>);

  @override
  _i6.Future<List<_i8.Review>> getMovieReviews(int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieReviews,
          [movieId],
        ),
        returnValue: _i6.Future<List<_i8.Review>>.value(<_i8.Review>[]),
      ) as _i6.Future<List<_i8.Review>>);

  @override
  _i6.Future<_i3.MovieDetails> getMovieDetails(int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetails,
          [movieId],
        ),
        returnValue: _i6.Future<_i3.MovieDetails>.value(_FakeMovieDetails_1(
          this,
          Invocation.method(
            #getMovieDetails,
            [movieId],
          ),
        )),
      ) as _i6.Future<_i3.MovieDetails>);

  @override
  _i6.Future<Map<dynamic, dynamic>> searchSeries(
    String? query,
    int? page,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchSeries,
          [
            query,
            page,
          ],
        ),
        returnValue:
            _i6.Future<Map<dynamic, dynamic>>.value(<dynamic, dynamic>{}),
      ) as _i6.Future<Map<dynamic, dynamic>>);

  @override
  _i6.Future<List<_i9.TvSeries>> getPopularSeries() => (super.noSuchMethod(
        Invocation.method(
          #getPopularSeries,
          [],
        ),
        returnValue: _i6.Future<List<_i9.TvSeries>>.value(<_i9.TvSeries>[]),
      ) as _i6.Future<List<_i9.TvSeries>>);

  @override
  _i6.Future<List<_i9.TvSeries>> getTopRatedSeries() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedSeries,
          [],
        ),
        returnValue: _i6.Future<List<_i9.TvSeries>>.value(<_i9.TvSeries>[]),
      ) as _i6.Future<List<_i9.TvSeries>>);

  @override
  _i6.Future<List<_i9.TvSeries>> getOnTheAirSeries() => (super.noSuchMethod(
        Invocation.method(
          #getOnTheAirSeries,
          [],
        ),
        returnValue: _i6.Future<List<_i9.TvSeries>>.value(<_i9.TvSeries>[]),
      ) as _i6.Future<List<_i9.TvSeries>>);

  @override
  _i6.Future<List<_i9.TvSeries>> getAiringTodaySeries() => (super.noSuchMethod(
        Invocation.method(
          #getAiringTodaySeries,
          [],
        ),
        returnValue: _i6.Future<List<_i9.TvSeries>>.value(<_i9.TvSeries>[]),
      ) as _i6.Future<List<_i9.TvSeries>>);

  @override
  _i6.Future<_i4.SeriesDetails> getSeriesDetails(int? seriesId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSeriesDetails,
          [seriesId],
        ),
        returnValue: _i6.Future<_i4.SeriesDetails>.value(_FakeSeriesDetails_2(
          this,
          Invocation.method(
            #getSeriesDetails,
            [seriesId],
          ),
        )),
      ) as _i6.Future<_i4.SeriesDetails>);

  @override
  _i6.Future<List<_i8.Review>> getSeriesReviews(int? seriesId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSeriesReviews,
          [seriesId],
        ),
        returnValue: _i6.Future<List<_i8.Review>>.value(<_i8.Review>[]),
      ) as _i6.Future<List<_i8.Review>>);

  @override
  _i6.Future<List<_i10.Backdrop>> getMovieImages(int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieImages,
          [movieId],
        ),
        returnValue: _i6.Future<List<_i10.Backdrop>>.value(<_i10.Backdrop>[]),
      ) as _i6.Future<List<_i10.Backdrop>>);

  @override
  _i6.Future<List<_i10.Backdrop>> getSeriesImages(int? seriesId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSeriesImages,
          [seriesId],
        ),
        returnValue: _i6.Future<List<_i10.Backdrop>>.value(<_i10.Backdrop>[]),
      ) as _i6.Future<List<_i10.Backdrop>>);
}
