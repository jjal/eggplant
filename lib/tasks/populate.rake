namespace :db do
  desc "Fill database with basic data"
  task populate: :environment do
    make_employees
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