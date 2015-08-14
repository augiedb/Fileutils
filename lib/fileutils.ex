defmodule Fileutils do

  def create_temp_directory do
    new_dir_name = get_full_temp_dir_name
    case does_directory_already_exist?(new_dir_name) do
      false -> make_temp_dir(new_dir_name)
      true  -> create_temp_directory
    end
  end

  def make_temp_dir(full_dir_path) do
    File.mkdir(full_dir_path)
    full_dir_path
  end

  def destroy_temp_directory(dirname) do
    File.rmdir(dirname)
  end

  def get_full_temp_dir_name do
    Path.join([get_temp_directory_host(), create_temp_dir_name()])
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
    "temp" <> create_random_string("", values, 16)
  end

  def get_temp_directory_host do
    System.tmp_dir()
  end

  def create_random_string(str, _, 0) do   # Last one
    str
  end

  def create_random_string(str, val, iteration) do
    char =  Enum.shuffle(val) |> Enum.take(1) |> List.to_string
    create_random_string(str <> char, val, iteration - 1)
  end

end
