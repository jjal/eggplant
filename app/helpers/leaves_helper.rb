module LeavesHelper
  def count_hours(leaves)
    total = 0
    leaves.each do |leave|
      total += (leave.end_at - leave.start_at) / 1.hour
    end
    return total
  end
end
