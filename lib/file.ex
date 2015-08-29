defmodule Fileutils.File do

@docmodule"""
    This module contains more functions to help with managing
    file system things.  Namly, files and directories.

    Fileutils.File.create_temp(directory)
"""
   
@doc """
  Returns the full path and file name of a requested new temp file.

  ## Examples

  Fileutils.Utils.create_temp_file("\tmp")
  #=> /tmp/tempfgredstyu85juy1deng9

""" 
@spec create_temp_file(Path.t) :: binary 
def create_temp_file(dirname \\ ".") do
  dirname |> get_full_temp_file_name |> make_temp_file
end

def make_temp_file(file) do
  File.touch(file)
  {:ok, file}
end

def destroy_temp_file(file) do
  case File.rm(file) do
    :ok           -> {:ok, file}
    {:error, msg} -> {:error, msg} 
  end
end

def get_full_temp_file_name(dirname) do
  file_idea = Path.join([dirname, Fileutils.Utils.create_temp_name("tempf", 16)])
  case Fileutils.Utils.already_exists?(file_idea) do
    true  -> get_full_temp_file_name(dirname)
    false -> file_idea
  end
end

end
