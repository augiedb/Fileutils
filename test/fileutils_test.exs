defmodule FileutilsTest do
  use ExUnit.Case
  doctest Fileutils

  alias Fileutils, as: F

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "Find temp directory to start with" do
    assert is_binary F.get_temp_directory
  end

  test "Create a random directory name" do
    tmp = F.create_dir_name 
    assert is_binary tmp
    assert String.length(tmp) == 20
  end

end
