# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Moyo.Repo.insert!(%Moyo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Moyo.Repo
alias Moyo.Studio.Block

Repo.insert!(%Block{
  title: "Gift im Bier – die Zweite", 
  url: "http://www.zeit.de/wissen/gesundheit/2017-08/glyphosat-im-bier-herbizid-umweltinstitut-krebs-stichproben",
  description: "Erinnern Sie sich noch an die Glyphosat-im-Bier-Meldung? Neue Stichproben zeigen: Nun sind weniger Rückstände drin. Toll! Nur war das Pflanzengift im Bier nie gefährlich."
})

Repo.insert!(%Block{
  title: "Albtraum für die Brexit-Hardliner", 
  url: "http://www.zeit.de/politik/ausland/2017-08/brexit-grossbritannien-europaeischer-gerichtshof",
  description: "Die EU könnte nach dem Brexit dauerhaften Einfluss auf die britische Rechtsprechung behalten. Für die Anti-EU-Fraktion wäre ein solches Zugeständnis ein Sakrileg."
})

Repo.insert!(%Block{
  title: "Tanker durchquert erstmals ohne Eisbrecher die Arktis", 
  url: "http://www.zeit.de/wirtschaft/2017-08/klimawandel-gastankschiff-eisbrecher-arktis-russland",
  description: "Ein russisches Schiff hat in nur 19 Tagen flüssiges Erdgas aus Norwegen nach Südkorea transportiert. Verantwortlich ist nicht nur der Klimawandel."
})
