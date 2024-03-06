import 'package:rxdart/rxdart.dart';
import '../../base/blocs/block_state.dart';
import '../../base/rest/api_helpers/api_exception.dart';
import '../../base/rest/models/rest_api_response.dart';
import '../user.dart';

class UserBloc {
  final _repository = UserRepository();
  final BehaviorSubject<ApiResponse<ListUserModel?>> _allDataFetcher =
      BehaviorSubject<ApiResponse<ListUserModel>>();
  Stream<ApiResponse<ListUserModel?>> get allData => _allDataFetcher.stream;

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
          await _repository.fetchAllData<ListUserModel>(params: params!);
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
