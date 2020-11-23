// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_table_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LeagueTableLocalAdapter extends TypeAdapter<LeagueTableLocal> {
  @override
  LeagueTableLocal read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LeagueTableLocal(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
      fields[4] as String,
      fields[5] as String,
      fields[6] as int,
      fields[7] as String,
      fields[8] as int,
      fields[9] as int,
      fields[10] as int,
      fields[11] as int,
      fields[12] as int,
      fields[13] as int,
      fields[14] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LeagueTableLocal obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.leagueName)
      ..writeByte(2)
      ..write(obj.position)
      ..writeByte(3)
      ..write(obj.teamId)
      ..writeByte(4)
      ..write(obj.teamName)
      ..writeByte(5)
      ..write(obj.teamLogo)
      ..writeByte(6)
      ..write(obj.playedGames)
      ..writeByte(7)
      ..write(obj.form)
      ..writeByte(8)
      ..write(obj.won)
      ..writeByte(9)
      ..write(obj.draw)
      ..writeByte(10)
      ..write(obj.lost)
      ..writeByte(11)
      ..write(obj.points)
      ..writeByte(12)
      ..write(obj.goalsFor)
      ..writeByte(13)
      ..write(obj.goalsAgainst)
      ..writeByte(14)
      ..write(obj.goalDifference);
  }
}
