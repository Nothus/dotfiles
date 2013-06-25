task default: 'link'
task :link do
  Dir['link.*'].each do |link|
    source = Dir.pwd + '/' + link
    target = Dir.home + '/' + link.gsub(/^link/, '')
    FileUtils.ln_sf source, target
  end
end
