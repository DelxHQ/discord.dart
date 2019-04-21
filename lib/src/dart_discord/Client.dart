part of discord_dart;

class Client {
  var _socket;

  String _token;

  int _lastS = null;

  Client(String token) {
    WebSocket.connect('wss://gateway.discord.gg?v=6&encoding=json').then((socket) {
      this._socket = socket;
      this._token = token;

      this._socket.listen(this._handshakeAPI());
    });
  }

  _heartbeat() {
    return JsonCodec().encode({"op": 1, "d": this._lastS});
  }

  _handshakeAPI() {

    const heartbeat_interval = const Duration(milliseconds: 41250);
    new Timer.periodic(heartbeat_interval, (Timer t) => this._socket.add(this._heartbeat()));
    
    this._socket.add(JsonCodec().encode({
      "op": 2,
      "d": {
        "token": "Bot ${this._token}",
        "properties": {"\$browser": "Discord.dart"},
        "large_threshold": 250,
        "compress": false
      },
    }));
  }
}
