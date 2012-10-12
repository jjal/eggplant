namespace :db do
  desc "Fill database with basic data"
  task populate: :environment do
    make_pay_rates
    make_employees
  end
end

def make_employees
  min_rate = PayRate.minimum(:id)
  max_rate = PayRate.maximum(:id)
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
    employee = Employee.create!(name: n, payrate_id: Random.new.rand(min_rate..max_rate))
  end
end

def make_pay_rates
  PayRate.create!(name:"Soksabike operations manager", type:"PermanentPayRate", monthly_rate: 300, FTE: 0.75) #phalla
  PayRate.create!(name:"Soksabike mechanic", type:"PermanentPayRate", monthly_rate: 125, FTE: 0.2) #ra
  #phiron?
  
  PayRate.create!(name:"Cafe business manager candidate", type:"PermanentPayRate", monthly_rate: 130, FTE: 0.75) #sopheap
  PayRate.create!(name:"Cafe operations manager candidate", type:"PermanentPayRate", monthly_rate: 110, FTE: 0.75) #chenda
  PayRate.create!(name:"Cafe supervisor", type:"PermanentPayRate", monthly_rate: 100, FTE: 1.0) #sean
  PayRate.create!(name:"Cafe kitchen supervisor", type:"PermanentPayRate", monthly_rate: 90, FTE: 1.0) #sakana
  
  PayRate.create!(name:"Normal cafe casual", type:"CasualPayRate", hourly_rate: 0.31) #kchao sopheap
  PayRate.create!(name:"Entry cafe casual", type:"CasualPayRate", hourly_rate: 0.26) #samnang, sophy
  
  PayRate.create!(name:"Entry level cafe contract", type:"PermanentPayRate", monthly_rate: 50, FTE: 0.53) #bopha, chaiya
  PayRate.create!(name:"Entry level cafe contract (probation)", type:"PermanentPayRate", monthly_rate: 37.5, FTE: 0.53) #bopha and chaiya after probation
  #vatha cafe?
  #yong cafe?
  
  PayRate.create!(name:"Entry level office", type:"PermanentPayRate", monthly_rate: 70, FTE: (12/45)) #yong, vatha
  #seavyi?
  
  
  
end