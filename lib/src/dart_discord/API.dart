part of discord_dart;

class API {
  String host = "https://discordapp.com/api";
  Map headers = {'User-Agent': 'DiscordDart (0.1.0)', 'Content-Type': 'application/json'};

  get(String uri) async {
    return await http.get("${this.host}/$uri", headers: this.headers);
  }

  post(String uri, Object content) async {
    return await http.post("${this.host}/$uri", body: JsonCodec().encode(content), headers: this.headers);
  }

  delete(String uri, Object content) async {
    return await http.post("${this.host}/$uri", body: JsonCodec().encode(content), headers: this.headers);
  }
}