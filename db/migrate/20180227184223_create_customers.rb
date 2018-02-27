class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table(:customers) do |t|
      t.column(:name, :string)
      t.column(:age, :integer)

      t.timestamps()
    end
  end
end
