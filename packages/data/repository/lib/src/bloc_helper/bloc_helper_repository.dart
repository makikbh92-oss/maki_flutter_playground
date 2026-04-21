import 'package:repository/src/common.dart';

class BlocHelperRepository {
  const BlocHelperRepository();

  EventTransformer<E> debounceTransformer<E>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }


  EventTransformer<E> throttleTransformer<E>(Duration duration) {
    return (events, mapper) => events.throttleTime(duration, trailing: true).flatMap(mapper);
  }

}