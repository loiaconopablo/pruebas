migration 4, :add_category_to_job_offers do
  up do
    modify_table :job_offers do
      add_column :category, String
    end
  end

  down do
    modify_table :job_offers do
      drop_column :category
    end
  end
end
