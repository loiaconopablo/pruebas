migration 7, :add_job_offers_id_to_consulta do
  up do
    modify_table :consulta do
      add_column :job_offer_id, Integer
    end
  end

  down do
    modify_table :consulta do
      drop_column :job_offer_id
    end
  end
end
