require 'json'
require 'json/add/date'

module JsonHandler
  def write_json(path, arr)
    File.open(path, 'w') do |file|
      json = JSON.pretty_generate(arr)
      file.write(json)
    end
  end

  def load_json(path)
    return [] unless File.exist?(path)

    read_path = File.read(path)
    JSON.parse(read_path, create_additions: true)
  end
end
