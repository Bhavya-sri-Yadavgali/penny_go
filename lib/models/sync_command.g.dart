// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_command.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SyncCommandAdapter extends TypeAdapter<SyncCommand> {
  @override
  final int typeId = 5;

  @override
  SyncCommand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SyncCommand(
      id: fields[0] as String,
      endpoint: fields[1] as String,
      action: fields[2] as SyncAction,
      data: (fields[3] as Map?)?.cast<String, dynamic>(),
      timestamp: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SyncCommand obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.endpoint)
      ..writeByte(2)
      ..write(obj.action)
      ..writeByte(3)
      ..write(obj.data)
      ..writeByte(4)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SyncCommandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SyncActionAdapter extends TypeAdapter<SyncAction> {
  @override
  final int typeId = 4;

  @override
  SyncAction read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SyncAction.create;
      case 1:
        return SyncAction.update;
      case 2:
        return SyncAction.delete;
      default:
        return SyncAction.create;
    }
  }

  @override
  void write(BinaryWriter writer, SyncAction obj) {
    switch (obj) {
      case SyncAction.create:
        writer.writeByte(0);
        break;
      case SyncAction.update:
        writer.writeByte(1);
        break;
      case SyncAction.delete:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SyncActionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
