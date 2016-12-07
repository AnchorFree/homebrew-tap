class PackerBuilderVultr < Formula
  desc 'packer-builder-vultr may let you use packer to build server images in vultr'
  homepage 'https://github.com/askholme/packer-builder-vultr'
  url 'https://dl.bintray.com/askholme/packer-vultr/packer-builder-vultr_linux_amd64.tar.gz'
  sha256 'a647f083cd1bf80414b71f64e5426fff51ff4a49874fab5d166b5667520fa882'

  depends_on 'packer' => :recommended

  def install
    bin.install 'packer-builder-vultr'
  end
end