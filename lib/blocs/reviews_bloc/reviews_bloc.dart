import 'package:bloc/bloc.dart';
import 'package:education_app/blocs/reviews_bloc/reviews_event.dart';
import 'package:education_app/blocs/reviews_bloc/reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc() : super(InitialReviewsState());

  @override
  Stream<ReviewsState> mapEventToState(ReviewsEvent event) async* {
    if (event is InitialReviewsEvent) {
      // İlgili event'e göre state dönüşü yapılabilir
      yield InitialReviewsState();
    }
  }
}
