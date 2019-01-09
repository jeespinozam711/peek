import 'package:peek/models/stats.dart';
import 'package:peek/network/iex_api_proxy.dart';


class StatsBloc {
  final IexApiProxy _iexApiProxy;
  final String symbol;
  Stream<KeyStats> keyStream = Stream.empty();

  StatsBloc(this._iexApiProxy, this.symbol): keyStream = _iexApiProxy.fetchStatsFor(symbol).asStream() ;

  void refresh() {
    keyStream = Stream.empty();
    keyStream = _iexApiProxy.fetchStatsFor(symbol).asStream() ;
  }
}