module CheckingAccount
  class Create < ::Micro::Case
    attribute :user_id
    attribute :amount

    def call!
      # byebug
      return Failure result: { message: 'Usuário não enviado' } if user_id.blank?

      # byebug
      user = User.find_by(id: user_id)
      return Failure result: { message: 'Usuário não encontrado' } if user.blank?

      checking_account = ::CheckingAccount::Record.new(user:, amount:)
      return Failure result: { message: 'Não foi possível criar a conta' } unless checking_account.save

      Success result: { checking_account: }
    end
  end
end
