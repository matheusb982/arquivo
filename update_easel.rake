namespace :products do
  desc "Atualizar cavalete"

  task update_easel: :environment do
    Product.find_each do |product|

      easel_update = product.first(easel_name: "ARGII")
      product = easel_update
      product.save

  end
end
