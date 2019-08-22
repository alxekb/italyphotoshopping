# frozen_string_literal: true

module PackagesHelper
  def package_items(package)
    response = []
    package.deals.each do |deal|
      response.push(["##{deal.item.id}", deal.item.item_name.name, deal.item.model.name, deal.item.color.name, deal.item.size.name].join(' '))
    end
    response
  end
end
