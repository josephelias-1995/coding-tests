class CreateTablesForTask2 < ActiveRecord::Migration[7.0]
  def up
    # add apples table and baskets table
    execute <<~SQL
      CREATE TABLE apples (
        id integer NOT NULL,
        basket_id integer,
        variety character varying,
        created_at timestamp without time zone NOT NULL,
        updated_at timestamp without time zone NOT NULL
      );
      CREATE TABLE baskets (
        id integer NOT NULL,
        capacity integer,
        fill_rate character varying,
        created_at timestamp without time zone NOT NULL,
        updated_at timestamp without time zone NOT NULL
      );
    SQL
  end

  def down
    # remove the exclusion constraint
    execute <<~SQL
      DROP TABLE apples;
      DROP TABLE baskets;
    SQL
  end
end
