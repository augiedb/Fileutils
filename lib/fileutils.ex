defmodule Fileutils do

  def get_temp_directory do
    System.tmp_dir()
  end

  def create_dir_name do

    :random.seed(:os.timestamp)
    values = "abcedefghijklmnopqrstuvwxyz0123456789" |> String.split("") 
    "temp" <> create_random_string("", values, 16)

#    rnd_list = Enum.map(1..17, fn(x) -> Enum.take(Enum.shuffle(values), 1) end)
#    "tmp" <> List.to_string(rnd_list)
  end

	def create_random_string(str, val, 0) do   # Last one
	  str
	end

	def create_random_string(str, val, iteration) do
	  char =  Enum.shuffle(val) |> Enum.take(1) |> List.to_string
	  create_random_string(str <> char, val, iteration - 1)
	end

end
