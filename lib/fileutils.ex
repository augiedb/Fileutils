defmodule Fileutils do
@docmodule"""
    This mocdule contains more functions to help with managing
    file system things.  Namly, files and directories.

    Fileutils.create_temp_file(directory)
    Fileutils.create.temp_dir()
"""
   
@doc """
  Returns the full path and file name of a requested new temp file.

  ## Examples

  Fileutils.create_temp_file("\tmp")
  #=> /tmp/tempfgredstyu85juy1deng9

""" 
@spec create_temp_file(Path.t) :: binary 
def create_temp_file(dirname \\ ".") do
  dirname |> get_full_temp_file_name |> make_temp_file
end

def make_temp_file(file) do
  File.touch(file)
  file
end

def destroy_temp_file(file) do
  case File.rm(file) do
    :ok -> true
    {:error, msg} -> msg 
  end
end

def get_full_temp_file_name(dirname) do
  file_idea = Path.join([dirname, create_temp_file_name()])
  case already_exists?(file_idea) do
    true  -> get_full_temp_file_name(dirname)
    false -> file_idea
  end
end

def already_exists?(file) do
  case File.stat(file) do
    {:ok, _} -> true
    _        -> false
  end
end

def create_temp_file_name do
  :random.seed(:os.timestamp)
  values = "abcedefghijklmnopqrstuvwxyz0123456789" |> String.split("", trim: true	) 
  "tempf" <> create_random_string("", values, 16)
end

#-----------------------------------------------#
 
@doc """
  Returns the full path of a new temporary directory

  ## Examples

  Fileutils.create_temp_dir()
  #=> /tmp/tempdfgredstyu85juy1deng9

""" 
@spec create_temp_directory() :: binary 

def create_temp_directory do
  get_full_temp_dir_name |> make_temp_dir
end

def make_temp_dir(full_dir_path) do
  File.mkdir(full_dir_path)
  full_dir_path
end

def destroy_temp_directory(dirname) do
  case File.rmdir(dirname) do
    :ok -> true
    {:error, msg} -> msg 
  end
end

def get_full_temp_dir_name do
  dir_idea = Path.join([get_temp_directory_host(), create_temp_dir_name()])
  case does_directory_already_exist?(dir_idea) do
    true  -> get_full_temp_dir_name
    false -> dir_idea
 end
end

def does_directory_already_exist?(dirname) do
  case File.stat(dirname) do
    {:ok, _} -> true
    _        -> false
  end
end

def create_temp_dir_name do
  :random.seed(:os.timestamp)
  values = "abcedefghijklmnopqrstuvwxyz0123456789" |> String.split("", trim: true	) 
  "tempd" <> create_random_string("", values, 16)
end

def get_temp_directory_host do
  System.tmp_dir()
end

def create_random_string(str, _, 0) do   # Last one
  str
end

def create_random_string(str, val, iteration) do
  char = Enum.shuffle(val) |> Enum.take(1) |> List.to_string
  create_random_string(str <> char, val, iteration - 1)
end

end
