module CheckingAccount
  class Create < ::Micro::Case
    attribute :user_id, :ammount

    def call
      byebug
    end
  end
end
