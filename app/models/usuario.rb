class Usuario < ApplicationRecord
  has_secure_password

  mount_uploader :avatar, AvatarUploader

  #apaga todos os posts quando o Usuario e apaga ou eh apagado.
  has_many :posts, dependent: :destroy

  validates_presence_of :avatar
  validates :nome, presence: true, length: {in: 2..20}
  validates :sobrenome, presence: true, length: {in: 2..50}
  validates :email, presence: true, length: {in: 5..50}, uniqueness: true
  validates :telefone, presence: true, length: {in: 8..15}, numericality: {only_integer: true}
  validates :data_nascimento, presence: true
  validates :password, length: {in: 6..12}, allow_nil: true
  validate :data_correta_maioridade
  validate :data_correta_passado
  validate :tamanho_foto

    def data_correta_maioridade
      if data_nascimento && data_nascimento > (DateTime.now - 18.years)
        errors.add(:data_nascimento,"Não pode ter menos de 18 anos")
      end
    end

    def data_correta_passado
      if data_nascimento && data_nascimento < (DateTime.now - 150.years)
        errors.add(:data_nascimento,"Você é uma múmia")
      end
    end

    def tamanho_foto
      if avatar.size > 5.megabytes
         errors.add(:avatar, "Muito grande, não pode possuir mais de 5 MB.")
      end
    end
  

end
