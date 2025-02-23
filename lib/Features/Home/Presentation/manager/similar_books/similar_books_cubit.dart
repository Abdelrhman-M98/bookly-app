import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Home/Data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  void fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    final failureOrBooks = await homeRepo.fetchSimilarBooks(category: category);
    failureOrBooks.fold(
      (failure) =>
          emit(SimilarBooksFailure(errorMessage: failure.errorMessage)),
      (books) => emit(SimilarBooksSuccess(books: books)),
    );
  }
}
