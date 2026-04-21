import 'package:maki_flutter_playground/features/profile/profile.dart';

part 'vm_profile_image_event.dart';
part 'vm_profile_image_state.dart';

class VmProfileImageBloc extends Bloc<VmProfileImageEvent, VmProfileImageState> {
  final ProfileRepository _repository;
  VmProfileImageBloc({
    required ProfileRepository profileRepository
  }) : _repository = profileRepository, super(const VmProfileImageState()) {
    on<EventProfileImagePicker>(_eventProfileImagePicker);
    on<EventProfileImageCancel>(_eventProfileImageCancel);
    on<EventProfileImageDelete>(_eventProfileImageDelete);
    on<EventProfileImageReset>(_eventProfileImageReset);
  }

  Future<void> _eventProfileImagePicker(EventProfileImagePicker event, Emitter<VmProfileImageState> emit) async {
    emit(state.copyWith(status: Status.loading, error: const DataError()));
    await emit.forEach(
        Stream.fromFuture(_repository.getThumbNail(
          title: event.title,
          done: event.done,
          cancel: event.cancel,
        ),),
        onData: (result) => result.fold(
                (error) => state.copyWith(status: Status.error, error: error),
                (value) => state.copyWith(status: Status.success, thumbnail: value, isDelete: false)
        )
    );
  }

  Future<void> _eventProfileImageCancel(EventProfileImageCancel event, Emitter<VmProfileImageState> emit) async {
    emit(state.copyWith(status: Status.initial, error: const DataError(), thumbnail: ''));
  }

  Future<void> _eventProfileImageDelete(EventProfileImageDelete event, Emitter<VmProfileImageState> emit) async {
    emit(state.copyWith(status: Status.initial, error: const DataError(), thumbnail: '', isDelete: true));
  }

  Future<void> _eventProfileImageReset(EventProfileImageReset event, Emitter<VmProfileImageState> emit) async {
    emit(state.copyWith(status: Status.initial, error: const DataError(), thumbnail: '', isDelete: false));
  }

}
