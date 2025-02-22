part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final String errorMessage;

  const FeaturedBooksSuccess({required this.errorMessage});
}

class FeaturedBooksFailure extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksFailure({required this.books});
}
