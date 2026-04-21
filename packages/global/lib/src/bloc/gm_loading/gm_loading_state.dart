part of 'gm_loading_bloc.dart';

final class GmLoadingState extends Equatable {
  final bool isLoading;

  const GmLoadingState({
    this.isLoading = false,

  });

  GmLoadingState copyWith({
    bool? isLoading,
  }) => GmLoadingState(
      isLoading: isLoading ?? this.isLoading,
  );

  @override
  List<Object> get props => [
    isLoading,
  ];


}
