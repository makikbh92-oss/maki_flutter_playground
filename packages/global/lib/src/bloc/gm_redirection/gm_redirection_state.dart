part of 'gm_redirection_bloc.dart';

enum RedirectType {
  ads, home
}

final class GmRedirectionState extends Equatable {
  final RedirectType redirectType;

  const GmRedirectionState({
    this.redirectType = RedirectType.ads
  });

  GmRedirectionState copyWith({
    RedirectType? redirectType
  }) => GmRedirectionState(
    redirectType: redirectType ?? this.redirectType
  );

  @override
  List<Object> get props => [
    redirectType
  ];

}
