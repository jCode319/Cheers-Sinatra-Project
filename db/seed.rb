mickey = User.new(username: "Mikey", email: "mouse@test.com", password: "mouse")
donald = User.new(username: "Donald", email: "duck@test.com", password: "duck")

margarita = Recipe.create(name: "Margarita", ingredients: "2 oz Tequila, 1 oz lime juice, 1/2 oz triple sec and 1/2 oz simple syrup", directions: "Mix  all ingredients in a shaker, pour over ice, garnish with lime wedge" spirit_type: "tequila", user: "mikey" )
cosmo = Recipe.create(name: "Cosmo", ingredients: "1 1/2 oz Citrus Vodka, 1/2 oz lime juice, 1 oz cointreau and 1/4 oz cranberry juice", directions: "Mix all ingredients in a shake, strain in a chilled glass, garnish with a lime wedge" spirit_type: "vodka", user: "donald" )

SavedRecipe.create(user: mickey, recipe: margarita)
SavedRecipe.create(user: donald, recipe: cosmo)
