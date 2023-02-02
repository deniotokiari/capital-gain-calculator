
/*void main() {
  late AuthRepository authRepository;
  late AlphavantageKeyRepository alphavantageKeyRepository;
  late SignUpUseCase sut;

  setUp(() {
    registerFallbackValue(Credential(email: '', password: ''));

    authRepository = _AuthRepositoryMock();

    alphavantageKeyRepository = _AlphavantageKeyRepositoryMock();
    when(() => alphavantageKeyRepository.saveKey(key: any(named: 'key'))).thenAnswer((_) => Future.value());

    sut = SignUpUseCase(authRepository, alphavantageKeyRepository);
  });

  test('success', () async {
    when(() => authRepository.createUser(any())).thenAnswer((_) => Future.value(CreateUserResult.success));

    final result = await sut.execute(SignUpUseCaseArguments(
      email: 'test@test.com',
      password: '',
      alphavantageKey: 'alphavantageKey',
    ));
    final userId = result.get<ValueGetter<String>>(instanceName: 'userId');

    verify(() => alphavantageKeyRepository.saveKey(key: any(named: 'key', that: equals('alphavantageKey')))).called(1);
    expect(userId, isNotNull);
    expect(userId(), 'test@test.com');
    expect(result, SignUpUseCaseResult.success);
  });

  test('failed', () async {
    when(() => authRepository.createUser(any())).thenAnswer((_) => Future.value(CreateUserResult.failed));

    final result = await sut.execute(SignUpUseCaseArguments(
      email: 'test@test.com',
      password: '',
      alphavantageKey: 'alphavantageKey',
    ));

    verifyNever(() => alphavantageKeyRepository.saveKey(key: any(named: 'key')));
    expect(result, SignUpUseCaseResult.failed);
  });

  test('weakPassword', () async {
    when(() => authRepository.createUser(any())).thenAnswer((_) => Future.value(CreateUserResult.weakPassword));

    final result = await sut.execute(SignUpUseCaseArguments(
      email: 'test@test.com',
      password: '',
      alphavantageKey: 'alphavantageKey',
    ));

    verifyNever(() => alphavantageKeyRepository.saveKey(key: any(named: 'key')));
    expect(result, SignUpUseCaseResult.weakPassword);
  });

  test('emailAlreadyInUse', () async {
    when(() => authRepository.createUser(any())).thenAnswer((_) => Future.value(CreateUserResult.emailAlreadyInUse));

    final result = await sut.execute(SignUpUseCaseArguments(
      email: 'test@test.com',
      password: '',
      alphavantageKey: 'alphavantageKey',
    ));

    verifyNever(() => alphavantageKeyRepository.saveKey(key: any(named: 'key')));
    expect(result, SignUpUseCaseResult.emailAlreadyInUse);
  });
}

class _AuthRepositoryMock extends Mock implements AuthRepository {}

class _AlphavantageKeyRepositoryMock extends Mock implements AlphavantageKeyRepository {}
*/
