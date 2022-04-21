module JsonMethods
  def self.json_create(object)
    new(*object['arguments'])
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'arguments' => @args
    }.to_json(*args)
  end
end
