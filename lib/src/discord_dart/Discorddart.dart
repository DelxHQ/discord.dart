part of discord_dart;

class Discorddart {
  
  String _token;
  Websocket _ws;

  Discorddart(this._token) {
    this._ws = Websocket();
  }
}

