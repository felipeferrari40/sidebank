# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CheckingAccount::Transfer, type: :use_case do
  describe '.call' do
    describe 'failures' do
      context 'Quando o valor for zero' do
        let(:checking_account_sender) { create(:checking_account) }
        let(:checking_account_receiver) { create(:checking_account) }
        let(:value) { 0 }

        it 'Retorna uma failure' do
          result = described_class.call(checking_account_sender:, checking_account_receiver:, value:)
          expect(result).to be_a_failure
        end
      end

      context 'Quando o valor for negativo' do
        let(:checking_account_sender) { create(:checking_account) }
        let(:checking_account_receiver) { create(:checking_account) }
        let(:value) { -10 }

        it 'Retorna uma failure' do
          result = described_class.call(checking_account_sender:, checking_account_receiver:, value:)
          expect(result).to be_a_failure
        end
      end

      context 'Quando o valor for não numérico' do
        let(:checking_account_sender) { create(:checking_account) }
        let(:checking_account_receiver) { create(:checking_account) }
        let(:value) { 'a' }

        it 'Retorna uma failure' do
          result = described_class.call(checking_account_sender:, checking_account_receiver:, value:)
          expect(result).to be_a_failure
        end
      end

      context 'Quando o valor for acima do valor da conta' do
        let(:checking_account_sender) { create(:checking_account) }
        let(:checking_account_receiver) { create(:checking_account) }
        let(:value) { 300 }

        it 'Retorna uma failure' do
          result = described_class.call(checking_account_sender:, checking_account_receiver:, value:)
          expect(result).to be_a_failure
        end
      end
    end

    describe 'success' do
      context 'Quando a tranferência for sucesso' do
        let(:checking_account_sender) { create(:checking_account) }
        let(:checking_account_receiver) { create(:checking_account) }
        let(:value) { 100 }

        it 'Retorna um sucesso' do
          result = described_class.call(checking_account_sender:, checking_account_receiver:, value:)

          expect(result).to be_a_success
        end
      end
    end
  end
end
