create index IX_98258A03 on Module1_Student (groupId);
create index IX_52AA60BB on Module1_Student (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_7339D9FD on Module1_Student (uuid_[$COLUMN_LENGTH:75$], groupId);