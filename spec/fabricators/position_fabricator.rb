Fabricator :position, class_name: Nbb::Models::Position do
  afko 'Celeritas-Donar HS 5'
  ID 2569
  status 'Actief'
  rang 1
  gespeeld 12
  percentage 84.4
  tegenscore 0
  punten 25
  eigenscore 200
  datum '2016-01-30'
  team 'Celeritas-Donar Heren 5'
  saldo 100
  positie 1
end

Fabricator :withdrawn_team, from: :position do
  status 'Teruggetrokken'
end
