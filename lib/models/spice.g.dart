// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spice.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpiceAdapter extends TypeAdapter<Spice> {
  @override
  final int typeId = 1;

  @override
  Spice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Spice(
      id: fields[0] as String,
      name: fields[1] as String,
      quantity: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Spice obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
