Keg.destroy_all
Beer.destroy_all
Style.destroy_all
Brewery.destroy_all
Tap.destroy_all
Pub.destroy_all
Users.destroy_all


style = Style.create([{name: 'West Coast India Pale Ale'}, {name: 'American Pale Ale'},
  {name: 'American India Pale Ale'}, {name: 'American Stout'},
  {name: 'Witbier'}, {name: 'Sour Ale'}, {name: 'Pilsner'}])
brewery = Brewery.create([{name: 'Pinta'},{name: 'Artezan'}, {name: 'Podgórz'}
  , {name: 'Pracownia Piwa'}])

WIPA = Style.first
APA = Style.second
AIPA = Style.third
AmericanStout = Style.fourth
Witbier = Style.find(5)
Sour = Style.find(6)
Pilsner = Style.find(7)

Pinta = Brewery.first
Artezan = Brewery.second
Podgórz = Brewery.third
Pracownia Brewery.fourth

beers = Beer.create([{name: 'Pacyfic Pale Ale', plato: 12.5, abv: 5, brewery: Artezan, style: APA },
  {name: 'Mera IPA', plato: 15, abv: 6.5, brewery: Artezan, style: WIPA},
  {name: 'Atak chmielu', plato: 15.1, abv: 6.1, brewery: Pinta, style: AIPA },
  {name: 'Uśmiech anieli', plato: 13, abv: 5.5, brewery: Podgórz, style: AmericanStout },
  {name: 'A ja pale ale', plato: 12.5, abv: 5, brewery: Pinta, style: APA },
  {name: 'American Black', plato: 13, abv: 5.5, brewery: Pinta, style: AmericanStout },
  {name: 'Pożegnanie lata', plato: 13, abv: 5.6, brewery: Pracownia, style: Sour },
  {name: 'Pierwsza pomoc', plato: 11, abv: 4.2, brewery: Pinta, style: Pilsner },
  {name: 'Modern drinking', plato: 15, abv: 6.5, brewery: Pinta, style: WIPA}])


4.times do |i|
  5.times do
    keg = Keg.new(in_use: false, expiration_date: Date.today+(i+1).months)
    keg.beer = Beer.find(Beer.first.id+i)
    keg.save
  end
end

4.times do |i|
  tap = Tap.new(number: i+1)
  kegs = Keg.avaiable_beers
  tap.keg = kegs[i]
  tap.save
end
