# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CheckingAccount::Deposit, type: :use_case do
  describe '.call' do
    describe 'failures' do
      # context 'Quando a conta for vazia' do
      #   let(:checking_account_id) { nil }
      #   let(:amount) { 0 }

      #   it 'Retorna uma failure result' do
      #     result = described_class.call(checking_account_id:, amount:)

      #     expect(result).to be_a_failure
      #   end
      # end

      # context 'Quando a conta for invalida' do
      #   let(:checking_account_id) { '****' }
      #   let(:amount) { 0 }

      #   it 'Retorna uma failure' do
      #     result = described_class.call(checking_account_id:, amount:)

      #     expect(result).to be_a_failure
      #   end
      # end

      context 'Quando o valor for invalido' do
        # let(:user) { User.create(email: 'email@email.com', password: '123456789') }
        let(:checking_account) { CheckingAccount::Record.create(user_id: User.last, amount: 0) }
        let(:checking_account_id) { checking_account.id }
        let(:value) { [0, -10, 'a'].sample }

        it 'Retorna uma failure' do
          result = described_class.call(checking_account_id:, value:)

          expect(result).to be_a_failure
        end
      end
    end

    # describe 'success' do
    #   context 'Quando a criação for sucesso' do
    #     let(:user_id) { '1' }
    #     let(:amount) { 0 }

    #     it 'Retorna um sucesso' do
    #       result = described_class.call(user_id:, amount:)

    #       expect(result).to be_a_success
    #     end
    #   end
    # end
  end
end
