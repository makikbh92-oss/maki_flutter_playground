part of 'vm_profile_image_bloc.dart';

sealed class VmProfileImageEvent extends Equatable {
  const VmProfileImageEvent();

  @override
  List<Object> get props => [];
}

final class EventProfileImagePicker extends VmProfileImageEvent {
  final String title;
  final String cancel;
  final String done;
  const EventProfileImagePicker({
    required this.title,
    required this.cancel,
    required this.done,
  });
}

final class EventProfileImageCancel extends VmProfileImageEvent {
  const EventProfileImageCancel();
}

final class EventProfileImageDelete extends VmProfileImageEvent {
  const EventProfileImageDelete();
}

final class EventProfileImageReset extends VmProfileImageEvent {
  const EventProfileImageReset();
}
