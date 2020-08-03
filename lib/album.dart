// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    this.type,
    this.data,
  });

  String type;
  List<Datum> data;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    type: json["type"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.title,
    this.song,
    this.track,
    this.bitrate,
    this.server,
    this.autodj,
    this.source,
    this.offline,
    this.summary,
    this.listeners,
    this.maxlisteners,
    this.reseller,
    this.serverstate,
    this.sourcestate,
    this.sourceconn,
    this.date,
    this.time,
    this.rawmeta,
    this.mountpoint,
    this.tuneinurl,
    this.directtuneinurl,
    this.proxytuneinurl,
    this.tuneinformat,
    this.webplayer,
    this.servertype,
    this.listenertotal,
    this.url,
  });

  String title;
  String song;
  Track track;
  String bitrate;
  String server;
  String autodj;
  String source;
  bool offline;
  String summary;
  int listeners;
  int maxlisteners;
  int reseller;
  bool serverstate;
  bool sourcestate;
  int sourceconn;
  String date;
  String time;
  String rawmeta;
  String mountpoint;
  String tuneinurl;
  String directtuneinurl;
  String proxytuneinurl;
  String tuneinformat;
  String webplayer;
  String servertype;
  int listenertotal;
  String url;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    song: json["song"],
    track: Track.fromJson(json["track"]),
    bitrate: json["bitrate"],
    server: json["server"],
    autodj: json["autodj"],
    source: json["source"],
    offline: json["offline"],
    summary: json["summary"],
    listeners: json["listeners"],
    maxlisteners: json["maxlisteners"],
    reseller: json["reseller"],
    serverstate: json["serverstate"],
    sourcestate: json["sourcestate"],
    sourceconn: json["sourceconn"],
    date: json["date"],
    time: json["time"],
    rawmeta: json["rawmeta"],
    mountpoint: json["mountpoint"],
    tuneinurl: json["tuneinurl"],
    directtuneinurl: json["directtuneinurl"],
    proxytuneinurl: json["proxytuneinurl"],
    tuneinformat: json["tuneinformat"],
    webplayer: json["webplayer"],
    servertype: json["servertype"],
    listenertotal: json["listenertotal"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "song": song,
    "track": track.toJson(),
    "bitrate": bitrate,
    "server": server,
    "autodj": autodj,
    "source": source,
    "offline": offline,
    "summary": summary,
    "listeners": listeners,
    "maxlisteners": maxlisteners,
    "reseller": reseller,
    "serverstate": serverstate,
    "sourcestate": sourcestate,
    "sourceconn": sourceconn,
    "date": date,
    "time": time,
    "rawmeta": rawmeta,
    "mountpoint": mountpoint,
    "tuneinurl": tuneinurl,
    "directtuneinurl": directtuneinurl,
    "proxytuneinurl": proxytuneinurl,
    "tuneinformat": tuneinformat,
    "webplayer": webplayer,
    "servertype": servertype,
    "listenertotal": listenertotal,
    "url": url,
  };
}

class Track {
  Track({
    this.artist,
    this.title,
    this.album,
    this.royaltytrackid,
    this.started,
    this.imageurl,
  });

  String artist;
  String title;
  dynamic album;
  int royaltytrackid;
  int started;
  String imageurl;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    artist: json["artist"],
    title: json["title"],
    album: json["album"],
    royaltytrackid: json["royaltytrackid"],
    started: json["started"],
    imageurl: json["imageurl"],
  );

  Map<String, dynamic> toJson() => {
    "artist": artist,
    "title": title,
    "album": album,
    "royaltytrackid": royaltytrackid,
    "started": started,
    "imageurl": imageurl,
  };
}
