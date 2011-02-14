require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def test_project_validity
    assert projects(:project1).valid?, "project1 is not valid" 
  end

  def test_uniqueness_of_name
  end
end
