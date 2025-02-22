import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/Home/Data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/Home/Data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    final failureOrBooks = await homeRepo.fetchNewestBooks();
    failureOrBooks.fold(
      (failure) => emit(NewestBooksFailure(errorMessage: failure.errorMessage)),
      (books) => emit(NewestBooksSuccess(books: books)),
    );
  }
}
