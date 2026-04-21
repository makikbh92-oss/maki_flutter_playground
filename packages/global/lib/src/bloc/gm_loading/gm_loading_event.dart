part of 'gm_loading_bloc.dart';


sealed class GmLoadingEvent extends Equatable {
  const GmLoadingEvent();

  @override
  List<Object> get props => [];

}

final class LoadingChange extends GmLoadingEvent{
  final bool isLoading;


  const LoadingChange({
    required this.isLoading,
  });

}
