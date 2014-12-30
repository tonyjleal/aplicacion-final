require 'test_helper'

class UserPerfilTest < ActionDispatch::IntegrationTest

	test 'Entrar y salir session' do

		#Visitar login y validarme como usuario
		post_via_redirect user_session_path, :user => { :email => users(:uno).email, :password => '12345678'}
		assert_equal '/', path
		assert_equal flash[:notice], 'Ha iniciado sesión satisfactoriamente.'

		#Salir de la sesion
		delete destroy_user_session_path
		assert_equal flash[:notice], 'Ha cerrado la sesión satisfactoriamente.'

	end

	test 'Login y entrar a configuración básica' do
		#Visitar login y validarme como usuario
		post_via_redirect user_session_path, :user => { :email => users(:uno).email, :password => '12345678'}
		assert_equal '/', path
		assert_equal flash[:notice], 'Ha iniciado sesión satisfactoriamente.'

		#Entrar a cambiar configuración básica
		get 'users/edit'
		assert_response :success		
	end

	test 'login y entrar al perfil' do
		#Visitar login y validarme como usuario
		post_via_redirect user_session_path, :user => { :email => users(:uno).email, :password => '12345678'}
		assert_equal '/', path
		assert_equal flash[:notice], 'Ha iniciado sesión satisfactoriamente.'

		#Entrar al perfil
		usuario = Perfil.where(:nombre => perfiles(:uno).nombre)
		get perfil_path(usuario)
		assert_response :success
	end

	test 'realizar registro' do
		#Registro de usuario
		post_via_redirect user_registration_path, :user => {:name => 'tony', :email => 'curso_rails@prueba.com', :password => '12345678', :password_confirmation => '12345678'}
		assert_equal 'Tu cuenta fue creada.', flash[:notice]
	end

	test 'realizar registro y entrar al perfil' do
		#Registro de usuario
		post_via_redirect user_registration_path, :user => {:name => 'tony', :email => 'curso_rails@prueba.com', :password => '12345678', :password_confirmation => '12345678'}
		assert_equal 'Tu cuenta fue creada.', flash[:notice]

		#Entrar al perfil del nuevo usuario
		usuario = User.where(:name => 'tony')
		get perfil_path(usuario)
		assert_response :success

		#Rellenar perfil
		put_via_redirect perfil_path, :perfil => {:nombre => 'TONY', 
			:apellidos => 'Leal', 
			:sexo => 'Hombre',
			:ciudad => 'Alicante',
			:fecha_nacimiento => '1982-10-07'
		}
	end
end