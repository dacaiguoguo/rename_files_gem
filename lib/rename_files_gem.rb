# frozen_string_literal: true

require_relative "rename_files_gem/version"

module RenameFilesGem
  class Error < StandardError; end

  # Your code goes here...
  require "fileutils"

  def self.rename_files_with_pattern(folder_path)
    unless Dir.exist?(folder_path)
      puts "The specified path does not exist or is not a directory."
      return
    end

    Dir.glob("#{folder_path}/**/*").each do |file_path|
      next unless File.file?(file_path) && file_path.include?("(")

      file_name = File.basename(file_path, ".*")
      file_extension = File.extname(file_path)

      if match = file_name.match(/(.+)\((\d+)\)/)
        new_file_name = "#{match[1].strip}-#{match[2].to_i + 1}#{file_extension}"
        new_file_path = File.join(File.dirname(file_path), new_file_name)

        FileUtils.mv(file_path, new_file_path)
        puts "Renamed #{File.basename(file_path)} to #{new_file_name}"
      end
    end
  end
end
