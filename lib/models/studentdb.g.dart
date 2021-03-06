// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentdb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentDBAdapter extends TypeAdapter<StudentDB> {
  @override
  final int typeId = 0;

  @override
  StudentDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentDB(
      name: fields[0] as String,
      number: fields[1] as int,
      email: fields[2] as String,
      photo: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentDB obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
