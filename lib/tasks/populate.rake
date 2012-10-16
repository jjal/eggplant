namespace :db do
  desc "Fill database with basic data"
  task populate: :environment do
    make_pay_rates
    make_employees
  end
end

def make_employees
  #min_rate = PayRate.minimum(:id)
  #max_rate = PayRate.maximum(:id)
  {
    "Sean" => PayRate::C_SUPERVISOR,
    "Long Sakana" => PayRate::C_KITCHEN_SUPERVISOR,
    "Kchao Sopheap" => PayRate::C_STAFF_CASUAL,
    "Leng Chhouert" => PayRate::C_STAFF_CASUAL,
    "Samnang" => PayRate::C_STAFF_CASUAL_ENTRY,
    "Sophy" => PayRate::C_STAFF_CASUAL_ENTRY,
    "Chan Chaiya" => PayRate::C_STAFF_PERMANENT_ENTRY_PROBATION,
    "Prom Bopha" => PayRate::C_STAFF_PERMANENT_ENTRY_PROBATION,
    "Vatha" => PayRate::C_STAFF_PERMANENT_ENTRY_PROBATION,
    "Phalla" => PayRate::S_OPERATIONS_MGR,
    "Seavyi" => PayRate::O_STAFF_ENTRY,
    "Khou Sopheap" => PayRate::C_BUSINESS_MGR,
    "Noon Ra" => PayRate::S_MECHANIC,
    "Yon Chenda" => PayRate::C_OPERATIONS_MGR,
    "Phearon" => PayRate::S_ASSISTANT
  }.each do |n,p|
    employee = Employee.create!(name: n, payrate_id: p)
  end
end

def make_pay_rates
  PayRate.create!(id: PayRate::S_OPERATIONS_MGR, name:"Soksabike operations manager", type:"PermanentPayRate", monthly_rate: 300, FTE: 0.75) #phalla
  PayRate.create!(id: PayRate::S_MECHANIC, name:"Soksabike mechanic", type:"PermanentPayRate", monthly_rate: 125, FTE: 0.2) #ra
  PayRate.create!(id: PayRate::S_ASSISTANT, name:"Soksabike assistant", type:"PermanentPayRate", monthly_rate: 70, FTE: 0.26) #phiron
  
  PayRate.create!(id: PayRate::C_BUSINESS_MGR, name:"Cafe business manager candidate", type:"PermanentPayRate", monthly_rate: 130, FTE: 0.75) #sopheap
  PayRate.create!(id: PayRate::C_OPERATIONS_MGR, name:"Cafe operations manager candidate", type:"PermanentPayRate", monthly_rate: 110, FTE: 0.75) #chenda
  PayRate.create!(id: PayRate::C_SUPERVISOR, name:"Cafe supervisor", type:"PermanentPayRate", monthly_rate: 100, FTE: 1.0) #sean
  PayRate.create!(id: PayRate::C_KITCHEN_SUPERVISOR, name:"Cafe kitchen supervisor", type:"PermanentPayRate", monthly_rate: 90, FTE: 1.0) #sakana
  
  PayRate.create!(id: PayRate::C_STAFF_CASUAL, name:"Normal cafe casual", type:"CasualPayRate", hourly_rate: 0.31) #kchao sopheap
  PayRate.create!(id: PayRate::C_STAFF_CASUAL_ENTRY, name:"Entry cafe casual", type:"CasualPayRate", hourly_rate: 0.26) #samnang, sophy
  
  PayRate.create!(id: PayRate::C_STAFF_PERMANENT_ENTRY, name:"Entry level cafe contract", type:"PermanentPayRate", monthly_rate: 50, FTE: 0.53) #bopha, chaiya
  PayRate.create!(id: PayRate::C_STAFF_PERMANENT_ENTRY_PROBATION, name:"Entry level cafe contract (probation)", type:"PermanentPayRate", monthly_rate: 37.5, FTE: 0.53) #bopha and chaiya after probation
  #vatha cafe?
  #yong cafe?
  
  PayRate.create!(id: PayRate::O_STAFF_ENTRY, name:"Entry level office", type:"PermanentPayRate", monthly_rate: 70, FTE: (12/45)) #yong, vatha
  #seavyi? 
end