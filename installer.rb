require 'net/http'

def get(path)
  uri = URI.parse(path)

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  http.start do
    http.request_get(uri.path) do |response|
      return response.body
    end
  end
end

def copy(path, filename)
  create_file(filename) do
    get(path)
  end
end


copy('https://raw.github.com/oivoodoo/rails3-template/master/Gemfile', 'Gemfile')

