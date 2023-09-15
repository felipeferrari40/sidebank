# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CheckingAccount::Create, type: :use_case do
  describe '.call' do
    describe 'failures' do
      context 'Quando o usuário for vazio' do
        let(:user_id) { nil }
        let(:amount) { 0 }

        it 'Retorna uma failure result' do
          result = described_class.call(user_id:, amount:)

          expect(result).to be_a_failure
        end
      end

      context 'Quando o usuário for invalido' do
        let(:user_id) { '****' }
        let(:amount) { 0 }

        it 'Retorna uma failure' do
          result = described_class.call(user_id:, amount:)

          expect(result).to be_a_failure
        end
      end
    end

    describe 'success' do
      context 'Quando a criação for sucesso' do
        let(:user) { User.create(email: 'email@email.com', password: '123456789') }
        let(:user_id) { user.id }
        let(:amount) { 0 }

        it 'Retorna um sucesso' do
          result = described_class.call(user_id:, amount:)

          expect(result).to be_a_success
        end
      end
    end
  end
end
