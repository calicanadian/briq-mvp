FactoryBot.define do
  factory :record do
    record_index {'4444.5555'}
    date_open {(Date.new() - 1.year).strftime('%m/%d/%Y')}
    record_status {'Consultation'}
    record_location {'1234 Fremont Street'}
    record_type {'Planning/Project/Project/PRJ'}
    description { 'Proposed seismic upgrade, (N) exterior paint, window refurbishment, elevator} replacement, building systems upgrade, (N) entrance.'}
    planner {'MCHANDLE'}
    record_module {'Planning'}
    city {'San Francisco'}
    state {'CA'}
    zip_code {'94109'}
  end
end
