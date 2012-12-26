class FixPayRatesSequence < ActiveRecord::Migration
    def up
        connection.execute(%q{
            select setval('pay_rates_id_seq', max(id))
            from pay_rates
        })
    end
    def down
        raise ActiveRecord::IrreversibleMigration
    end
end
