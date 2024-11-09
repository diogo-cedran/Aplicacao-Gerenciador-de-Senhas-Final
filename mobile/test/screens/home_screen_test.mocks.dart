// Mocks generated by Mockito 5.4.4 from annotations
// in mobile/test/screens/home_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mobile/models/senha_model.dart' as _i5;
import 'package:mobile/services/api_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i2.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get baseUrl => (super.noSuchMethod(
        Invocation.getter(#baseUrl),
        returnValue: _i3.dummyValue<String>(
          this,
          Invocation.getter(#baseUrl),
        ),
      ) as String);

  @override
  _i4.Future<List<_i5.SenhaModel>> getSenhas() => (super.noSuchMethod(
        Invocation.method(
          #getSenhas,
          [],
        ),
        returnValue: _i4.Future<List<_i5.SenhaModel>>.value(<_i5.SenhaModel>[]),
      ) as _i4.Future<List<_i5.SenhaModel>>);

  @override
  _i4.Future<void> createSenha(_i5.SenhaModel? senha) => (super.noSuchMethod(
        Invocation.method(
          #createSenha,
          [senha],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteSenha(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteSenha,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updateSenha(_i5.SenhaModel? senha) => (super.noSuchMethod(
        Invocation.method(
          #updateSenha,
          [senha],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}