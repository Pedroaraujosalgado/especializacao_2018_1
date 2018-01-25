class RedefinirSenhaController < ApplicationController
  def busca
  end

  #PoST redefinir_senha
  def recuperar
    usuario = Usuario.find_by(email: params[:usuario][:email])
    if usuario
      senha = Passgen::generate(:length => 6)
      usuario.password = senha
      usuario.password_confirmation = senha
      usuario.save

      UsuarioMailer.esqueci_minha_senha(usuario, senha).deliver_now
      flash.now[:alert] = "Email com instruções de recuperação será enviado"
      redirect_to login_path
    else
      flash.now[:alert] = "Usuario não encontrado"
      render "busca"
    end
  end
end
