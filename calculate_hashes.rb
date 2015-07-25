beginning = Time.now

path = ARGV[ARGV.count - 2]

if path == nil
	puts "usage: ruby calculate_hashes.rb path"
	abort
end

require 'digest/md5'

def calculateHashInDir(path) 
	Dir.foreach(path) do |fname|
			pathToFile = path+"/"+fname

			if fname == "." || fname == ".DS_Store" || fname == ".."
				next 
			elsif File.directory?(pathToFile)
				calculateHashInDir(pathToFile)
				next
			end	

			hash = Digest::MD5.hexdigest(File.read(pathToFile))+" "+
						Digest::SHA256.hexdigest(File.read(pathToFile));

			puts hash									
	end
end

calculateHashInDir(path)
