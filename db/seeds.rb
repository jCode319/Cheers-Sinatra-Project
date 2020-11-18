User.destroy_all
Recipe.destroy_all
SavedRecipe.destroy_all

mickey = User.create(username: "Mikey", email: "mouse@test.com", password: "mouse")
donald = User.create(username: "Donald", email: "duck@test.com", password: "duck")

margarita = Recipe.create(name: "Margarita", ingredients: "2 oz Tequila, 1 oz lime juice, 1/2 oz triple sec and 1/2 oz simple syrup", directions: "Mix  all ingredients in a shaker, pour over ice, garnish with lime wedge", spirit_type: "tequila")
cosmo = Recipe.create(name: "Cosmo", ingredients: "1 1/2 oz Citrus Vodka, 1/2 oz lime juice, 1 oz cointreau and 1/4 oz cranberry juice", directions: "Mix all ingredients in a shaker, strain in a chilled glass, garnish with a lime wedge", spirit_type: "vodka")

SavedRecipe.create(user: mickey, recipe: margarita)
SavedRecipe.create(user: donald, recipe: cosmo)
