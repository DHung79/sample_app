import 'package:rxdart/rxdart.dart';
import '../../../configs/bloc/block_state.dart';
import '../../../configs/rest/api_helpers/api_exception.dart';
import '../../../configs/rest/models/rest_api_response.dart';
import '../models/drop_ship.dart';
import '../resources/drop_ship_repository.dart';

class DropShipBloc {
  final _repository = DropShipRepository();
  final BehaviorSubject<ApiResponse<DropShipModel?>> _allDataFetcher =
      BehaviorSubject<ApiResponse<DropShipModel>>();
  Stream<ApiResponse<DropShipModel?>> get allData => _allDataFetcher.stream;

  final _allDataState = BehaviorSubject<BlocState>();
  Stream<BlocState> get allDataState => _allDataState.stream;

  bool _isFetching = false;

  fetchAllData({Map<String, dynamic>? params}) async {
    if (_isFetching) return;
    _isFetching = true;
    // Start fetching data.
    _allDataState.sink.add(BlocState.fetching);
    try {
      // Await response from server.
      final data =
          await _repository.fetchAllData<DropShipModel>(params: params!);
      if (_allDataFetcher.isClosed) return;
      if (data.error != null) {
        // Error exist
        _allDataFetcher.sink.addError(data.error!);
      } else {
        // Adding response data.
        _allDataFetcher.sink.add(data);
      }
    } on AppException catch (e) {
      _allDataFetcher.sink.addError(e);
    }
    // Complete fetching.
    _allDataState.sink.add(BlocState.completed);
    _isFetching = false;
  }

  dispose() {
    _allDataFetcher.close();
    _allDataState.close();
  }
}
