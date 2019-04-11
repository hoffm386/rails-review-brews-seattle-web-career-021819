# README

## Objective

* Perform full CRUD for 1 resource
* Connect two resources together
* Understand form helpers

### Getting Started

- [x] Make a Rails app called brews-crew
- [x] Make a model Brew that has attributes `blend_name`, `origin`, `notes`, and `strength`.  The first three are strings, and `strength` is an integer
- [x] add 'faker' gem to Gemfile
- [x] create seed data

### Deliverables

#### Brews Resource

- [x] route for '/brews' that displays all of your coffees as links to their show pages, with links to delete each brew
- [x] route to create a new brew
- [x] route to edit a brew
- [x] route to '/brews/strongest' find the brews with the highest strength _(we didn't create a separate view for this, just routed to the `show` view for the brew with the highest strength)_

#### Purchase Resource

A purchase has one brew, and a brew has many purchases.  A purchase also has a `customer_name`, which is a string, and a `price`, which is a float.

- [x] Make a model Purchase with the appropriate attributes
- [x] route to create a new purchase
- [x] the new page should allow you to choose the brew that was purchased
- [x] route for '/purchases' that displays all of the purchases as links to their show pages
- [x] the show page should include a link to the brew that was purchased

Now that you have created the purchase association:
- [x] the brew show page should display a list of all of the customers who have enjoyed that brew

Bonus
- [ ] a brew name should be unique _(to do this we would have added a validation in the Brew model)_
- [ ] a purchase should have a `size`, which should be small, medium, or large _(to do this we would have added a migration to change the schema for `purchases` and a validation in the Purchase model)_
- [ ] a purchase should have a `creamer_strength`, which should be light, regular, or none _(to do this we would have added a migration to change the schema for `purchases` and a validation in the Purchase model)_
- [ ] a purchase should have `special_instructions`, which should be less than 140 characters _(to do this we would have added a migration to change the schema for `purchases` and a validation in the Purchase model)_

## Faker Hint

We haven't used Faker that much so far.  If you're not sure how to generate seed data with Faker, it should look something like:
```
5.times do
  Brew.create(
    blend_name: Faker::Coffee.blend_name,
    origin: Faker::Coffee.origin,
    notes: Faker::Coffee.notes,
    strength: rand(1..5)
  )
end

10.times do
  Purchase.create(
    customer_name: Faker::FunnyName.name_with_initial,
    price: Faker::Commerce.price(range = 3..7.0),
    brew: Brew.order("RANDOM()").first
  )
end
```
