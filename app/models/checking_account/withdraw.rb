module CheckingAccount
  class Withdraw < ::Micro::Case
    attribute :checking_account_id
    attribute :value

    def call!
      return Failure result: { message: 'Valor deve ser numérico' } if value.is_a?(String)

      return Failure result: { message: 'Valor deve ser maior do que zero' } if value.zero? || value.negative?

      checking_account = ::CheckingAccount::Record.find(checking_account_id)

      return Failure result: { message: 'Saldo insuficiente' } if checking_account.amount < value

      checking_account.amount -= value
      return Failure result: { message: 'Não foi possível realizar o saque' } unless checking_account.save

      Success result: { checking_account: }
    end
  end
end
