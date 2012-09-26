namespace :db do
  desc "Fill database with basic data"
  task populate: :environment do
    make_employees
    make_pay_rates
  end
end

def make_employees
  ["Sean", 
  "Long Sakana", 
  "Kchao Sopheap", 
  "Leng Chhouert", 
  "Samnang", 
  "Sophy", 
  "Chan Chaiya", 
  "Prom Bopha", 
  "Vatha", 
  "Phalla", 
  "Seavyi", 
  "Khou Sopheap", 
  "Noon Ra", 
  "Yon Chenda", 
  "Phearon"].each do |n|
    Employee.create!(name: n)
  end
end

def make_pay_rates
  PayRate.create!(name:"Phalla's contract", type:"PermanentPayRate", monthly_rate: 300, FTE: 0.75)
  PayRate.create!(name:"Cafe MC contract", type:"PermanentPayRate", monthly_rate: 220, FTE: 0.5)
  PayRate.create!(name:"Entry cafe casual", type:"CasualPayRate", hourly_rate: 0.31)
  PayRate.create!(name:"Normal cafe casual - probation", type:"CasualPayRate", hourly_rate: 0.18)
  PayRate.create!(name:"Normal cafe casual", type:"CasualPayRate", hourly_rate: 0.25)
end