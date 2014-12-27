require 'test_helper'

class PerfilTest < ActiveSupport::TestCase

  test "perfil nuevo erroneo" do
    perfil = Perfil.new
    perfil.save
    assert !perfil.valid?
  end

  test "perfil nuevo correcto" do 
    perfil = Perfil.new
    perfil.nombre = "PruebaNombre"
    perfil.apellidos = "PruebaApellidos"
    perfil.sexo = "Hombre"
    perfil.fecha_nacimiento = "1981-05-01"
    perfil.ciudad = "Sevilla"
    perfil.user_id = 2
    perfil.save
    assert perfil.valid?
  end


end
