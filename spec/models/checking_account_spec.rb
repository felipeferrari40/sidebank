# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CheckingAccount::Record, type: :model do
  describe '.call' do
    describe 'failures' do
      context 'Quando o usuário for vazio' do
        let(:user_id) { nil }

        it 'Retorna uma failure' do
          result = describe_class.call

          expect(result).to be_a_failure
        end
      end
    end
  end
end
