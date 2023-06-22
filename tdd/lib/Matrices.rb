class Matrices
  attr_reader :x, :y, :matriz_1 # geters Te declara solo los geters
  
# metodos de instancia 
# contructor paso el tamaño de la matriz
  def initialize(x, y, matri = Array.new(x) {Array.new(y){0}}) 
  # Compruebo que se pasen por parametros una matriz
    if !matri.is_a?Array 
      raise "El argumento no es un array"
    end
    for i in matri do 
      if !i.is_a?Array 
        raise "El array no tiene arrays dentro"
      end 
    end

    @x, @y = x, y
    @matriz_1 = matri 
    return @matriz_1

  end

  def to_s
    matri = ""
    itera = 0
    while  itera != @x
      iterb = 0
      while iterb != @y
        matri += "#{@matriz_1[itera][iterb]} " 
        iterb += 1
      end
      matri += "\n"
      itera += 1
    end
    return matri
  end

  def suma(matriz_2)
    # Compruebo que se pase una matriz por parametros
    if !matriz_2.is_a?Matrices
      raise "El argumento no es una matriz"
    end
    matri = Array.new(@x) {Array.new(@y)}
    
    # Compruebo que las metrices sea cuadradas
    if ((@x == matriz_2.x) and (@y == matriz_2.y))
      for i in 0..@x-1 do
        for j in 0..@y-1 do
          matri[i][j] = @matriz_1[i][j] + matriz_2.matriz_1[i][j]
        end
      end
      return Matrices.new(@x, @y, matri)
    else
      raise "Las matrices no son del mismo tamaño"
    end
  end

  def productoEscalar(num)
    if !num.is_a?Integer
      raise "El argumento no es un numero"
    end
    matri = Array.new(@x) {Array.new(@y)}
    for i in 0..@x-1 do
      for j in 0..@y-1 do
        matri[i][j] = @matriz_1[i][j] * num
      end
    end
    return Matrices.new(@x, @y, matri)
  end

  def traspuesta
    matri = Array.new(@x) {Array.new(@y)}
    for i in 0..@x-1 do
      for j in 0..@y-1 do
        matri[i][j] = @matriz_1[j][i] 
      end
    end
    return Matrices.new(@x, @y, matri)
  end
end
