defmodule Fileutils.File do

  @docmodule"""
      This module contains more functions to help with managing
      file system things.  Namly, files and directories.

      Fileutils.File.create_temp(directory)
  """
     
  @doc """
    Returns the full path and file name of a requested new temp file.

    Optionally, you can include a directory name to put it in.  If you
    leave that blank, the module will default you to the current directory.

    ## Examples

    Fileutils.Utils.create_temp_file("\tmp")
    #=> /tmp/tempfgredstyu85juy1deng9

  """ 
  @spec create_temp(Path.t) :: {:ok, binary}

  def create_temp(dirname \\ ".") do
    dirname |> get_full_temp_file_name |> make_temp
  end

  def get_full_temp_file_name(dirname) do
    file_idea = Path.join([dirname, Fileutils.Utils.create_temp_name("tempf", 16)])
    case Fileutils.Utils.already_exists?(file_idea) do
      true  -> get_full_temp_file_name(dirname)
      false -> file_idea
    end
  end

  def make_temp(file) do
    File.touch(file)
    {:ok, file}
  end

  @doc """
    To delete the temporary file, use the `destroy_temp`/1 function
    with the single argument being the full name and location of the
    file to be deleted.
  """
  def destroy_temp(file) do
    case File.rm(file) do
      :ok           -> {:ok, file}
      {:error, msg} -> {:error, msg} 
    end
  end

end
