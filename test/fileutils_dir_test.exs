defmodule FileutilsDir_Test do
  use ExUnit.Case
#  doctest Fileutils

  alias Fileutils.Dir  , as: F
  alias Fileutils.Utils, as: U

  # This one basically is repeating the test that System.tmp_dir
  # already has but I'm just testing Mix Text with it.
  test "Find temp directory to start with" do
    assert is_binary F.get_temp_directory_host
    assert F.get_temp_directory_host == System.tmp_dir()
  end

  test "Create a random directory name" do
    tmp = U.create_temp_name("tempd", 16)
    assert is_binary tmp
    assert String.length(tmp) == 21
  end

  test "Check if a directory already exists or not" do
    tmp = F.get_full_temp_dir_name
    assert U.already_exists?(System.tmp_dir) == true 
    assert U.already_exists?(tmp) == false
  end

  test "Make a new directory" do
    subdir = F.create_temp_directory
    assert U.already_exists?(subdir)
    assert {:error, :enoent} = F.destroy_temp_directory("Make_up_some_stuff_bad_dir")
    assert {:ok, _} = F.destroy_temp_directory(subdir)
    assert U.already_exists?(subdir) == false
  end

end
