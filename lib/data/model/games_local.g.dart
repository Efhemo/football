// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GamesLocalAdapter extends TypeAdapter<GamesLocal> {
  @override
  GamesLocal read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GamesLocal(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as String,
      fields[4] as String,
      fields[5] as int,
      fields[6] as String,
      fields[7] as String,
      fields[8] as int,
      fields[9] as int,
      fields[10] as int,
      fields[11] as int,
      fields[12] as int,
      fields[13] as String,
      fields[14] as String,
      fields[15] as int,
      fields[16] as String,
      fields[17] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GamesLocal obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.leagueId)
      ..writeByte(1)
      ..write(obj.leagueName)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.utcDate)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.matchDay)
      ..writeByte(6)
      ..write(obj.winner)
      ..writeByte(7)
      ..write(obj.duration)
      ..writeByte(8)
      ..write(obj.scoreFullTimeHomeTeam)
      ..writeByte(9)
      ..write(obj.scoreFullTimeAwayTeam)
      ..writeByte(10)
      ..write(obj.scoreHalfTimeHomeTeam)
      ..writeByte(11)
      ..write(obj.scoreHalfTimeAwayTeam)
      ..writeByte(12)
      ..write(obj.homeTeamId)
      ..writeByte(13)
      ..write(obj.homeTeamName)
      ..writeByte(14)
      ..write(obj.homeTeamLogo)
      ..writeByte(15)
      ..write(obj.awayTeamId)
      ..writeByte(16)
      ..write(obj.awayTeamName)
      ..writeByte(17)
      ..write(obj.awayTeamLogo);
  }
}
