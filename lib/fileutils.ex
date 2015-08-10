defmodule Fileutils do

  def create_temp_directory(dirname) do
    File.mkdir(dirname)
  end

  def destory_temp_directory(dirname) do
    File.rmdir(dirname)
  end

  def get_full_tmp_dir_name do
    Path.join([get_temp_directory_host(), get_temp_dir_name()])
  end

  def get_temp_dir_name do
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
