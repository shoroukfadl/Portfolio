import 'package:equatable/equatable.dart';
import 'package:portfolio/Features/home/domain/entities/portfilio_entity.dart';

import '../../../../Utilities/Constants/enums.dart';

class PortfolioState extends Equatable {
  final PortfolioEntity? data;
  final HomeSection section;
  final RequestStatus loading;

  const PortfolioState(
      {this.data,
      this.section = HomeSection.about,
      this.loading = RequestStatus.init});

  factory PortfolioState.init() => const PortfolioState();

  PortfolioState copyWith(
          {PortfolioEntity? data,
          RequestStatus? loading,
          HomeSection? section}) =>
      PortfolioState(
          data: data ?? this.data,
          loading: loading ?? this.loading,
          section: section ?? this.section);

  @override
  // TODO: implement props
  List<Object?> get props => [data, loading, section];
}
