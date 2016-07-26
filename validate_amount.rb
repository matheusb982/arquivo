validates_each :amount, on: :create do |record, field, value|
    user = User.find( record.user_id )

    if record.payment_method == 'free_credits'
      if user.activation_balance < value
        record.errors.add(field, 'Você não tem saldo suficiente')
      end
    end

    if record.payment_method == 'credits'
      if user.withdrawal_balance < value
        record.errors.add(field, 'Você não tem saldo suficiente')
      end
    end

  end
