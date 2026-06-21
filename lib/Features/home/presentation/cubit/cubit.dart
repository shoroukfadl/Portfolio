import 'package:bloc/bloc.dart';
import 'package:portfolio/Features/home/domain/usecases/get_data_use_case.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final GetDataUseCase getDataUseCase;

  PortfolioCubit({required this.getDataUseCase}) : super(PortfolioState.init());

  Future<void> getData() async {
    emit(state.copyWith(loading: RequestStatus.loading));
    final res = await getDataUseCase.call();
    res.fold((l) {
      emit(state.copyWith(loading: RequestStatus.error));
    }, (r) {
      emit(state.copyWith(loading: RequestStatus.success, data: r));
    });
  }

  void changeSection(HomeSection section) {
    if (section == state.section)
      return;
    else
      emit(state.copyWith(section: section));
  }
}
