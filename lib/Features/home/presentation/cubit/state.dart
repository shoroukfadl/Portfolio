import 'package:equatable/equatable.dart';
import 'package:portfolio/Features/home/domain/entities/portfilio_entity.dart';

import '../../../../Utilities/Constants/enums.dart';

class PortfolioState extends Equatable {
  final PortfolioEntity? data;
  final RequestStatus loading;

  const PortfolioState({this.data, this.loading = RequestStatus.init});

  factory PortfolioState.init() => const PortfolioState();

  PortfolioState copyWith({PortfolioEntity? data, RequestStatus? loading}) =>
      PortfolioState(data: data ?? this.data, loading: loading ?? this.loading);

  @override
  // TODO: implement props
  List<Object?> get props => [data, loading];
}
