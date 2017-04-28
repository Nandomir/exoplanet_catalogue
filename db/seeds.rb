require('pry')
require('pry-byebug')
require_relative('../models/astronomer.rb')
require_relative('../models/exoplanet.rb')
require_relative('../models/discovery.rb')

Discovery.delete_all
Astronomer.delete_all
Exoplanet.delete_all


astronomer1 = Astronomer.new({
  'discoverer' => 'Michel Mayor',
  'observation_type' => 'Doppler spectroscopy'
  });
astronomer2 = Astronomer.new({
  'discoverer' => 'Kepler Space Telescope',
  'observation_type' => 'Photometry/Transit'
  });
astronomer3 = Astronomer.new({
  'discoverer' => 'Spitzer Space Telescope',
  'observation_type' => 'Infrared wavelengths/microlensing'
  });
astronomer4 = Astronomer.new({
  'discoverer' => 'La Silla Observatory',
  'observation_type' => 'Visible wavelengths using active optics'
  });
astronomer5 = Astronomer.new({
  'discoverer' => 'Hubble Space Telescope',
  'observation_type' => 'Visible and ultraviolet wavelengths'
  });
astronomer6 = Astronomer.new({
  'discoverer' => 'Trans-Atlantic Exoplanet Survey (TrES)',
  'observation_type' => 'Photometry/Transit'
  })

astronomer1.save
astronomer2.save
astronomer3.save
astronomer4.save
astronomer5.save
astronomer6.save

exoplanet1 = Exoplanet.new({
  'name' => '51b Pegasi b',
  'type' => 'Hot Jupiter',
  'habitable' => false,
  'mass' => 0.47,
  'discovery' => '10/6/1995'
  });
exoplanet2 = Exoplanet.new({
  'name' => 'TrES-2b',
  'type' => 'Hot Jupiter',
  'habitable' => false,
  'mass' => 1.2,
  'discovery' => '8/21/2006'
  });
exoplanet3 = Exoplanet.new({
  'name' => 'Kepler 91b',
  'type' => 'Hot Jupiter',
  'habitable' => false,
  'mass' => 0.88,
  'discovery' => '2/5/2013'
  });
exoplanet4 = Exoplanet.new({
  'name' => 'TRAPPIST-1b',
  'type' => 'Rocky earth-size',
  'habitable' => true,
  'mass' => 0.85,
  'discovery' => '6/3/2016'
  });
exoplanet5 = Exoplanet.new({
  'name' => 'Kepler-186f',
  'type' => 'Rocky earth-size',
  'habitable' => true,
  'mass' => 1.4,
  'discovery' => '4/17/2014'
  });
exoplanet6 = Exoplanet.new({
  'name' => 'TRAPPIST-1d',
  'type' => 'Rocky earth-size',
  'habitable' => true,
  'mass' => 0.41,
  'discovery' => '10/7/2016'
  });
exoplanet7 = Exoplanet.new({
  'name' => 'HD 189733b',
  'type' => 'Hot Jupiter',
  'habitable' => false,
  'mass' => 1.16,
  'discovery' => '5/10/2015'
  });
exoplanet8 = Exoplanet.new({
  'name' => 'OGLE-2014-BLG-0124L',
  'type' => 'Hot Jupiter',
  'habitable' => false,
  'mass' => 0.5,
  'discovery' => '10/15/2014'
  });

exoplanet1.save
exoplanet2.save
exoplanet3.save
exoplanet4.save
exoplanet5.save
exoplanet6.save
exoplanet7.save
exoplanet8.save

discovery1 = Discovery.new({
  'astronomer_id' => astronomer1.id,
  'exoplanet_id' => exoplanet1.id
  });
discovery2 = Discovery.new({
  'astronomer_id' => astronomer2.id,
  'exoplanet_id' => exoplanet3.id
  });
discovery3 = Discovery.new({
  'astronomer_id' => astronomer2.id,
  'exoplanet_id' => exoplanet5.id
  });
discovery4 = Discovery.new({
  'astronomer_id' => astronomer3.id,
  'exoplanet_id' => exoplanet8.id
  });
discovery5 = Discovery.new({
  'astronomer_id' => astronomer3.id,
  'exoplanet_id' => exoplanet6.id
  });
discovery6 = Discovery.new({
  'astronomer_id' => astronomer4.id,
  'exoplanet_id' => exoplanet6.id
  });
discovery7 = Discovery.new({
  'astronomer_id' => astronomer5.id,
  'exoplanet_id' => exoplanet7.id
  });
discovery8 = Discovery.new({
  'astronomer_id' => astronomer6.id,
  'exoplanet_id' => exoplanet2.id
  });

discovery1.save
discovery2.save
discovery3.save
discovery4.save
discovery5.save
discovery6.save
discovery7.save
discovery8.save

binding.pry
nil