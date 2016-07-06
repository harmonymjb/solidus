object false
node(:count) { @products.count }
node(:total_count) { @products.total_count }
node(:current_page) { @products.current_page }
node(:per_page) { params[:per_page] || Kaminari.config.default_per_page }
node(:pages) { @products.total_pages }
child(@products => :products) do
  extends "spree/api/products/show"
end
