module CheckingAccount
  class Transfer < ::Micro::Case
    attribute :checking_account_sender
    attribute :checking_account_receiver
    attribute :value

    def call!
      return validate_failures if validate_failures

      checking_account_sender.amount -= value
      checking_account_receiver.amount += value

      unless checking_account_sender.save || checking_account_receiver.save
        return Failure result: { message: 'Não foi possível realizar o tranferência' }
      end

      Success result: { message: 'Transferência realizada com sucesso' }
    end

    def validate_sender
      Failure result: { message: 'Conta de origem não encontrada' } unless checking_account_sender
    end

    def validate_receiver
      Failure result: { message: 'Conta de destino não encontrada' } unless checking_account_receiver
    end

    def validate_value
      return Failure result: { message: 'Valor deve ser numérico' } if value.is_a?(String)

      Failure result: { message: 'Valor deve ser maior do que zero' } if value.zero? || value.negative?
    end

    def validate_balance
      Failure result: { message: 'Saldo insuficiente' } if checking_account_sender.amount < value
    end

    def validate_failures
      validate_sender || validate_receiver || validate_value || validate_balance
    end
  end
end
