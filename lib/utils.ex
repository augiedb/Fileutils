defmodule Fileutils.Utils do

@docmodule"""
    This module contains shared functions for Fileutils
    These are all functions that could apply to both 
    files and directories
"""
     
  def already_exists?(filesystem_item) do
    case File.stat(filesystem_item) do
      {:ok, _} -> true
      _        -> false
    end
  end

  def create_temp_name(prefix, no_of_chars) do
    :random.seed(:os.timestamp)
    values = "abcedefghijklmnopqrstuvwxyz0123456789" |> String.split("", trim: true	) 
    prefix <> create_random_string("", values, no_of_chars)
  end


#____ Probably should be defp from here on out  ____#

  def create_random_string(str, _, 0) do   # Last one
    str
  end

  def create_random_string(str, val, iteration) do
    char = Enum.shuffle(val) |> Enum.take(1) |> List.to_string
    create_random_string(str <> char, val, iteration - 1)
  end

end
