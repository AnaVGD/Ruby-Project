
require 'Matrices'

describe Matrices do

  matriz = [[1,2,3],[4,5,6],[7,8,9]]
  matriz2 = [[7,8,9],[1,2,3],[4,5,6]]

  mat = Matrices.new(3, 3, matriz)
  mat2 = Matrices.new(3, 3, matriz2)

  it "Se instancia el tamaño de las filas y columnas" do
    expect(Matrices.new(3, 3)).not_to eq(nil) #matcher
  end

  it "Se debe crear un una matriz 3x3" do
    expect(Matrices.new(3,3).x).to eq(3) 
    expect(Matrices.new(3,3).y).to eq(3) 
  end

  it "Se debe asignar los valores a la matriz vacia" do
    # mat = Matrices.new(3, 3)
    expect(Matrices.new(3, 3, matriz).to_s).to eq("1 2 3 \n4 5 6 \n7 8 9 \n")
  end

  it "Se debe sumar dos matrices" do
    expect(mat.suma(mat2).to_s).to eq("8 10 12 \n5 7 9 \n11 13 15 \n")
  end

  it "Se debe hacer el producto escalar de una matriz y un numero" do
    expect(mat.productoEscalar(4).to_s).to eq("4 8 12 \n16 20 24 \n28 32 36 \n")
  end

  it "Se debe hacer la transpuesta de una matriz" do
    expect(mat.traspuesta.to_s).to eq("1 4 7 \n2 5 8 \n3 6 9 \n")
  end
end