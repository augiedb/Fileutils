defmodule Fileutils.Dir do

alias Fileutils.Utils, as: U 

@docmodule"""
"""
 
@doc """
  Returns the full path of a new temporary directory

  ## Examples

  Fileutils.create_temp_dir()
  #=> /tmp/tempdfgredstyu85juy1deng9

""" 
@spec create_temp() :: binary 

def create_temp do
  get_full_temp_dir_name |> make_temp
end

def make_temp(full_dir_path) do
  File.mkdir(full_dir_path)
  full_dir_path
end

def destroy_temp(dirname) do
  case File.rmdir(dirname) do
    :ok           -> {:ok, dirname}
    {:error, msg} -> {:error, msg}
  end
end

def get_full_temp_dir_name do
  dir_idea = Path.join([get_temp_directory_host(), U.create_temp_name("tempd", 16)])
  case U.already_exists?(dir_idea) do
    true  -> get_full_temp_dir_name
    false -> dir_idea
 end
end

def get_temp_directory_host do
  System.tmp_dir()
end


end
