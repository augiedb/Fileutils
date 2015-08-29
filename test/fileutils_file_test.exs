
defmodule FileutilsFile_Test do
  use ExUnit.Case
  #doctest Fileutils

  alias Fileutils.File, as: F
  alias Fileutils.Dir,  as: D 
  alias Fileutils.Utils, as: U

  # This one basically is repeating the test that System.tmp_dir
  # already has but I'm just testing Mix Text with it.
  test "Find temp directory to start with" do
    assert is_binary D.get_temp_directory_host
    assert D.get_temp_directory_host == System.tmp_dir()
  end

  test "Create temp file" do
    {:ok, testfile} = F.create_temp_file
    assert U.already_exists?(testfile) == true
    assert {:ok, testfile} == F.destroy_temp_file(testfile)
    assert false ==  U.already_exists?("/tmp/junkityjunkjunk.txt")
    assert U.already_exists?(testfile) == false 

  end

end
