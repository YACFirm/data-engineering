class Sales::Loader
  def initialize(file)
    @file = file
  end

  def load
    total_revenue = 0
    csv_text = @file.read
    csv = CSV.parse(csv_text, :headers => true, :col_sep => "\t")
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      row = Hash[row.map { |k, v| [k.gsub(' ', '_'), v] }]
      sale = Sale.create!(row.to_hash.symbolize_keys)
      total_revenue += sale.purchase_count * sale.item_price
    end
    return total_revenue
  end
end
