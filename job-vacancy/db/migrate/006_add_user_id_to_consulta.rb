migration 6, :add_user_id_to_consulta do
  up do
    modify_table :consulta do
      add_column :user_id, Integer
    end
  end

  down do
    modify_table :consulta do
      drop_column :user_id
    end
  end
end
