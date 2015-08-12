defmodule FileutilsTest do
  use ExUnit.Case
  doctest Fileutils

  alias Fileutils, as: F

  test "the truth" do
    assert 1 + 1 == 2
  end

  # This one basically is repeating the test that System.tmp_dir
  # already has but I'm just testing Mix Text with it.
  test "Find temp directory to start with" do
    assert is_binary F.get_temp_directory_host
    assert F.get_temp_directory_host == System.tmp_dir()
  end

  test "Create a random directory name" do
    tmp = F.get_temp_dir_name
    IO.puts tmp
    assert is_binary tmp
    assert String.length(tmp) == 20
  end

  test "Check if a directory already exists or not" do
    tmp = F.get_temp_dir_name
    assert Fileutils.does_directory_already_exist?(System.tmp_dir) == true 
    assert Fileutils.does_directory_already_exist?(tmp) == false
  end


end
