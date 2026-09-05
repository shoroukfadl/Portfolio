import 'package:equatable/equatable.dart';
import 'package:portfolio/Features/home/domain/entities/portfilio_entity.dart';

import '../../../../Utilities/Constants/enums.dart';
import '../../data/models/portfilio_model.dart';

class PortfolioState extends Equatable {
  final PortfolioEntity? data;
  final HomeSection section;
  final RequestStatus loading;

  double get projectLEN => data?.projects.length.toDouble() ?? 0.0;

  double get experience => data?.profile?.experince?.toDouble() ?? 0.0;

  const PortfolioState({
    this.data,
    this.section = HomeSection.about,
    this.loading = RequestStatus.init,
  });

  factory PortfolioState.init() => const PortfolioState();

  PortfolioState copyWith({
    PortfolioEntity? data,
    RequestStatus? loading,
    HomeSection? section,
  }) =>
      PortfolioState(
        data: data ?? this.data,
        loading: loading ?? this.loading,
        section: section ?? this.section,
      );

  Map<String, dynamic> toJson(PortfolioState state) {
    if (data == null) return {};
    return {
      'data': PortfolioModel.toModel(data!).toFullJson(),
    };
  }

  static PortfolioState fromJson(Map<String, dynamic> json) {
    try {
      if (json.isEmpty || json['data'] == null) return PortfolioState.init();

      final rawData = json['data'] as Map<String, dynamic>;
      return PortfolioState(
        data: PortfolioModel.fromJson(rawData).fromModel(),
        loading: RequestStatus.init,
      );
    } catch (e) {
      print('❌ fromJson error: $e');
      return PortfolioState.init();
    }
  }

  @override
  List<Object?> get props => [data, loading, section];
}
