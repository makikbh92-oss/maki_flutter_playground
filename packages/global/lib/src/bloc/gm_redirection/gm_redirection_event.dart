part of 'gm_redirection_bloc.dart';

sealed class GmRedirectionEvent extends Equatable {
  const GmRedirectionEvent();

  @override
  List<Object> get props => [];
}

final class RedirectionGoAds extends GmRedirectionEvent {
  const RedirectionGoAds();
}

final class RedirectionGoHome extends GmRedirectionEvent {
  const RedirectionGoHome();
}



