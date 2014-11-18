### This is the data
rates = ['start_date', 'end_date', 'one_child', 'one_adult', 'travel_module', 'origin', 'destination']
contexts = ['departure_date', 'return_date', 'travel_class', 'adult', 'child', 'travel_module', 'origin', 'destination']
variants = ['travel_class']

rate_option_types = rates.each.map {|r| Spree::OptionType.find_by_name(r)}
context_option_types = contexts.each.map {|c| Spree::OptionType.find_by_name(c)}
variant_option_types = variants.each.map {|v| Spree::OptionType.find_by_name(v)}

### Creating Product Type if not created
Spree::ProductType.where(:name => 'flight').first_or_create(
   :presentation => 'Flight',
   :rate_option_types => rate_option_types,
   :context_option_types => context_option_types,
   :variant_option_types => variant_option_types
)