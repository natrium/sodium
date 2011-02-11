
I18n.available_locales.each do |l|
  I18n.fallbacks.map(l => 'en')
end

# for the french gays
I18n.fallbacks.map('fr' => 'jp')
