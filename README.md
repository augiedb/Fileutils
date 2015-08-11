# Fileutils

## Warning:

This module is in very early development. I have some ideas that will involve restructuring it completely, if I decide to pull on that trigger.  Also, naming is hard. I intend to get this thing functional before I rename things in a better way. It's just how I work.


## Description:

This module is intended to be a collection of utilities for dealing
with folders and files in specific ways.

__create_temp_directory__
The first major component to be created is the one that will create
and destroy temporary directories for you.  It based on Perl's 
File::TempDir
and was first hinted in my Core Elixir series here: [http://variousandsundry.com/cs/blog/2015/08/06/core-elixir-system-dot-tmp-dir-slash-0/](http://variousandsundry.com/cs/blog/2015/08/06/core-elixir-system-dot-tmp-dir-slash-0/)

## Installation

  1. Add fileutils to your list of dependencies in mix.exs:

        def deps do
          [{:fileutils, "~> 0.0.1"}]
        end

  2. Ensure fileutils is started before your application:

        def application do
          [applications: [:fileutils]]
        end
