# frozen_string_literal: true

# Just fake service that allow us to test the #add_dependency method of
# application controller.
class TestControllerLevelService
  def test_method
    'test output'
  end
end
