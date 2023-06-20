import 'dart:io';

String fixture(String name) =>
    File('lib/data/repositories/jsonFixture/$name').readAsStringSync();
