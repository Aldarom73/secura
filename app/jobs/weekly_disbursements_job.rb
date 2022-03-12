class WeeklyDisbursementsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    now = Time.now
    monday = now - (now.wday == 0 ? 6 : (now.wday - 1)).days
    monday = Time.utc(monday.year, monday.month, monday.day)

    monday_previous = monday - 7.days

    if Disbursement.find_by(start_at: monday_previous)
      puts 'Warning: The script has already been excetuted this week. Delete the existing records for this week to allow recalculation'
    else
      orders = Order.where.not(completed_at: nil).and(Order.where(completed_at: monday_previous..(monday-1.seconds)))

      hash = Hash.new {0}

      orders.each do |tuple|
        hash[tuple.merchant_id] = hash[tuple.merchant_id] + tuple.amount * (tuple.amount < 50 ? 0.01 : (tuple.amount > 300 ? 0.0085 : 0.0095))
      end

      hash.keys.each do |merchant|
        disbursement = Disbursement.new do |d|
          d.merchant = Merchant.find_by(id: merchant)
          d.amount = hash[merchant]
          d.start_at = monday_previous
        end
        if disbursement.save
          puts 'Success: Disbursement saved for merchant: ' + disbursement.merchant.id.to_s
        else
          puts "Error: Disbursement not saved for merchant: " + disbursement.merchant.id.to_s
        end
      end
    end
  end
end
