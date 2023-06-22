=begin

Práctica de Laboratorio #5. Pruebas Unitarias.
  
=end

# require 'pry'

class ExpRegulares
  attr_reader :cad1
  def initialize(cad1)
    @cad1 = cad1
  end

  def to_s
    "#{cad1}"
  end

  def concatenacion(cad2)
    # if @cad1.to_s.length == 1
      ExpRegulares.new(@cad1.to_s + '.' + cad2.to_s)
    # else
    #   ExpRegulares.new('(' + @cad1.to_s + ')' + '.' + cad2.to_s)
    # end
  end

  def alternativa(cad2)
    if @cad1.to_s.length == 1
      ExpRegulares.new(@cad1.to_s + '|' + cad2.to_s)
    else if @cad1.include?("|")
      ExpRegulares.new('(' + @cad1.to_s + ')' + '|' + cad2.to_s)
    else
      ExpRegulares.new(@cad1.to_s  + '|' + cad2.to_s)
    end
    end
  end

  def kleener
    if @cad1.to_s.length == 1
      ExpRegulares.new(@cad1.to_s + '*')
    else
      ExpRegulares.new( '(' + @cad1.to_s + ')*')
    end
  end
end

# binding.pry

# PRUEBAS
# er1 = ExpRegulares.new('a')
# er2 = ExpRegulares.new('b')
# er3 = er1.concatenacion(er2)
# er4 = er1.alternativa(er3)
# er5 = er2.kleener
# er6 = er4.kleener
# er7 = er4.concatenacion(er2)
# er8 = er7.alternativa(er5)
# puts prueba1.Kleene
# puts prueba1.alternativa('ana')
