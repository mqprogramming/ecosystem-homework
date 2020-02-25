class Bear

  attr_reader :name, :type, :stomach
  attr_writer :stomach

  def initialize( name, type, stomach = [] )
    @name = name
    @type = type
    @stomach = stomach
  end

  def roar
    return "ROOOOOOOAAAAAAAARRRRR!!!!!!!"
  end

end
