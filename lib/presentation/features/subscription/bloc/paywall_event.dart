part of 'paywall_bloc.dart';

sealed class PaywallEvent extends Equatable {}

class GetCurrentOfferingEvent extends PaywallEvent {
  @override
  List<Object?> get props => [];
}

class ChangeSelectedPackageIdEvent extends PaywallEvent {
  final String packageId;

  ChangeSelectedPackageIdEvent(this.packageId);

  @override
  List<Object?> get props => [packageId];
}

class PurchaseSelectedPackageEvent extends PaywallEvent {
  @override
  List<Object?> get props => [];
}

class RestorePurchaseEvent extends PaywallEvent {
  @override
  List<Object?> get props => [];
}
