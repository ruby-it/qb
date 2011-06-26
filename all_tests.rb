Dir['vendor/**/lib'].each do |dir|
  $: << dir
end
$: << 'test/unit'
$: << 'test/functional'
Dir['test/unit/*.rb'].each do |f|
  load f
end
Dir['test/functional/*.rb'].each do |f|
  load f
end
