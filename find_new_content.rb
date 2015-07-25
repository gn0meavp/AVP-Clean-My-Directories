beginning = Time.now

# hashes file by calculate_hashes.rb
path_repo_hashes = ARGV[ARGV.count - 2]						
# path to new content
path_new_content = ARGV[ARGV.count - 1]						

if path_repo_hashes == nil || path_new_content == nil
	puts "usage: ruby find_new_content.rb hash_file new_content_dir"
	puts "to create hashes file use calculate_hashes.rb"
	abort
end

def findNewContent(path_new_content) 
	Dir.foreach(path_new_content) do |fname|
			pathToFile = path_new_content+"/"+fname

			if fname == "." || fname == ".DS_Store" || fname == ".."
				next 
			elsif File.directory?(pathToFile)
				findNewContent(pathToFile)
				next
			end	

			hash = Digest::MD5.hexdigest(File.read(pathToFile))+" "+
						Digest::SHA256.hexdigest(File.read(pathToFile));

			if $hashes.include?(hash) == false
				puts pathToFile
			end

	end
end



require 'set'
require 'digest/md5'

$hashes = Set.new()

$hashes.add("a")

puts "Loading hashes..."

File.open(path_repo_hashes, "r") do |f|
  f.each_line do |line|
  	line = line[0, line.size-1]
    $hashes.add(line)
  end
end

puts "\nLoaded #{$hashes.size} hashes"

puts "\nLooking for new content in "+path_new_content

findNewContent(path_new_content)
