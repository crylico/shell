cask 'lr-dev-comm' do
  version '1.4.0'
  sha256 '384612960f6aa857ad5e978a82effaf6bb6b52314c69d078ad04bdad36a51562'

  url 'https://dev-software.locorobo.co/communicator/Communicator_1.4.0.dmg'
  name 'LocoRobo Communicator (Dev)'
  homepage 'https://app.locorobo.co'
  license :mit

  app 'LocoRobo Communicator.app'
end
