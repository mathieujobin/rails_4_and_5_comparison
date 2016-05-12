require 'test_helper'

class TreeTest < ActiveSupport::TestCase
  test "relations can include other models" do
    t = Tree.create(name: 'erable a sucre')
    t.birds.create(name: "merle d'amerique")
    t.birds.create(name: "oie blanche")
    t.birds.create(name: "hirondelle")
    assert t.birds.is_a?(ActiveRecord::Associations::CollectionProxy)
    assert t.birds.where(name: "hirondelle").is_a?(ActiveRecord::AssociationRelation)

    assert t.birds.includes(:feathers).is_a?(ActiveRecord::AssociationRelation)
    assert t.birds.where(name: "hirondelle").includes(:feathers).is_a?(ActiveRecord::AssociationRelation)

    # The following two should be true, or maybe I missunderstood something?
    assert false == t.birds.where(name: "hirondelle").includes(:feathers).include?(:feathers), "include? should be true for AssociationRelation"
    assert false == t.birds.includes(:feathers).include?(:feathers), "include? should be true for CollectionProxy"

    # these passes
    assert Tree.includes(:birds).where(birds: {name: 'hirondelle'}).to_a
    assert Tree.includes(:birds => :feathers).where({birds: {name: 'hirondelle', feathers: "feathers.id is not null"}}).to_a

    # these three fail
    assert Tree.includes(:birds).where("birds.name = 'hirondelle'").to_a
    assert Tree.includes(:birds => :feathers).where("birds.name = 'hirondelle' and feathers.id is not null").to_a
    assert t.birds.includes(:feathers).where('feathers.id is not null').to_a
    
  end
end
