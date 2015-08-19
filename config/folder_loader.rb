module Config
  class FolderLoader
    def load
      app_folders.each do |folder|
        Dir[folder].each do |file|
          require file
        end
      end
    end

    private

    def app_folders
      [
        './app/adapters/**/*.rb',
        './app/models/**/*.rb',
        './app/controllers/**/*.rb'
      ]
    end
  end
end