module TeacherSessionTestTables
  TABLES = [
    OpenStruct.new(
      session: OpenStruct.new(identifier: nil, password: 'dkjgnjk'),
      expected_result: false
    ),
    OpenStruct.new(
      session: OpenStruct.new(identifier: 'valid@identifier.com', password: nil),
      expected_result: false
    ),
    OpenStruct.new(
      session: OpenStruct.new(identifier: nil, password: nil),
      expected_result: false
    ),
    OpenStruct.new(
      session: OpenStruct.new(identifier: '', password: ''),
      expected_result: false
    ),
    OpenStruct.new(
      session: OpenStruct.new(identifier: 'bad.identifier.com', password: ''),
      expected_result: false
    ),
    OpenStruct.new(
      session: OpenStruct.new(identifier: 'bad.identifier.com', password: ''),
      expected_result: false
    ),
    OpenStruct.new(
      session: OpenStruct.new(identifier: 'bad@identifier.com', password: ''),
      expected_result: false
    ),
    OpenStruct.new(
      session: OpenStruct.new(identifier: 'b@e.c', password: ''),
      expected_result: false
    ),
    OpenStruct.new(
      session: OpenStruct.new(identifier: 'bad@identifier.com', password: 'pass'),
      expected_result: false
    ),
    OpenStruct.new(
      session:
        OpenStruct.new(
          identifier: 'bad@identifier.com' * 75,
          password: 'pass' * 75
        ),
      expected_result: false
    ),
    OpenStruct.new(
      session:
        OpenStruct.new(identifier: 'bad@identifier.com', password: 'password'),
      expected_result: true
    )
  ].freeze
end
