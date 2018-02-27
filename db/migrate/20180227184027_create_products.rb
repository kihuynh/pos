class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table(:products) do |p|
      p.column(:name, :string)
      p.column(:price, :integer)

      p.timestamps()
    end
  end
end
