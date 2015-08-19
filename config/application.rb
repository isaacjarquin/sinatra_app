require './config/folder_loader.rb'

module Config
  class Application
    def self.start
      Config::FolderLoader.new.load
    end
  end
end