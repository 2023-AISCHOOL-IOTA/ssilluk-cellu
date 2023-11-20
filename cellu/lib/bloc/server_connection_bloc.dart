import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/server_connection_repository.dart';

abstract class ServerConnectionEvent {}

class CheckConnection extends ServerConnectionEvent {}

enum ServerConnectionState { initial, connected, disconnected, error }

class ServerConnectionBloc extends Bloc<ServerConnectionEvent, ServerConnectionState> {
  final ServerConnectionRepository repository;

  ServerConnectionBloc(this.repository) : super(ServerConnectionState.initial) {
    on<CheckConnection>(_onCheckConnection);
  }

  void _onCheckConnection(CheckConnection event, Emitter<ServerConnectionState> emit) async {
    try {
      final isConnected = await repository.checkConnection();
      emit(isConnected ? ServerConnectionState.connected : ServerConnectionState.disconnected);
    } catch (_) {
      emit(ServerConnectionState.error);
    }
  }
}
