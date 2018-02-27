class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table(:purchases) do |p|
      p.column(:payment, :string)
      p.column(:product_id, :integer)
      p.column(:customer_id, :integer)

      p.timestamps()
    end
  end
end
