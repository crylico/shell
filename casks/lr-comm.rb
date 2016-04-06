cask 'lr-comm' do
  version '1.4.0'
  sha256 'e6430376fdfb2ac75bda758e651586ec857fa89d91e65f736376af347c6deebc'

  url 'https://software.locorobo.co/communicator/Communicator_1.4.0.dmg'
  name 'LocoRobo Communicator'
  homepage 'https://app.locorobo.co'
  license :mit

  app 'LocoRobo Communicator.app'
end
