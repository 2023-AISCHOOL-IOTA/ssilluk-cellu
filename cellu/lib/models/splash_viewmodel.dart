class SplashScreenViewModel extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void loadInitialData() {
    // 초기 데이터 로딩 로직을 이곳에 추가
    // 백엔드 서버 연결 등의 작업을 수행
    // 데이터 로딩이 완료되면 _isLoading 값을 변경하고 UI를 업데이트
    _isLoading = false;
    notifyListeners(); // UI 갱신 알림
  }
}
