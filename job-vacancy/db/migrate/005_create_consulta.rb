migration 5, :create_consulta do
  up do
    create_table :consulta do
      column :id, Integer, :serial => true
      column :title, DataMapper::Property::String, :length => 255
      column :description, DataMapper::Property::Text
    end
  end

  down do
    drop_table :consulta
  end
end
