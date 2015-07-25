beginning = Time.now

path = ARGV[ARGV.count - 1]

if path == nil
	puts "usage: ruby find_dups.rb path"
	abort
end

require 'digest/md5'

def findDups(path) 
	puts "Looking into "+path+" directory.."

	Dir.foreach(path) do |fname|

			pathToFile = path+"/"+fname

			if fname == "." || fname == ".DS_Store" || fname == ".."
				next 
			elsif File.directory?(pathToFile)
				findDups(pathToFile)
				next
			end	

			hash = Digest::MD5.hexdigest(File.read(pathToFile))+" "+
						Digest::SHA256.hexdigest(File.read(pathToFile));

			if $hashes.has_key?(hash)
				puts "! " + pathToFile + " is duplicate of " + $hashes[hash]				
			else
#				puts pathToFile.to_s+" "+hash					
				$hashes[hash] = pathToFile				
			end					

	end

end

$hashes = Hash.new(0)
findDups(path)
