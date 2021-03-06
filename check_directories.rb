beginning = Time.now

path_1 = ARGV[ARGV.count - 2]
path_2 = ARGV[ARGV.count - 1]

if (ARGV.count > 2) 
    
    params = ARGV[0..ARGV.count - 3]
    
end

compare_XMP = false

if params != nil && params.count > 0 
   
    if params.include? "--compare_XMP"
        compare_XMP = true
        puts "XMP files will be compared!"
    else
        puts "XMP files will be skipped!"
    end
   
end

if path_1 == nil || path_2 == nil
	puts "usage: ruby check_directories.rb [--compare_XMP] path1 path2"
	abort
end

if path_1 == path_2
	puts "Cannot compare directory "+ path_1 +" with itself. Sorry =/"
	abort
end

require 'digest/md5'

def findUniqueHashesForDirectory(path, compare_XMP)
	puts "Looking into "+path+" directory.."	
	
	hashes = Hash.new(0)
	
		Dir.foreach(path) do |fname|
			if fname == "." || fname == ".DS_Store" || fname == ".." || (compare_XMP == false && File.extname(fname) == ".XMP")
				next 
			end	
			
			hash = Digest::MD5.hexdigest(File.read(path+"/"+fname))+" "+
						Digest::SHA256.hexdigest(File.read(path+"/"+fname));
			
			if hashes.key?(hash)
				puts "	Warning! '"+fname+"' is duplicate with '"+hashes[hash]+"'"
			end
		
# 			puts fname.to_s+" "+hash
			hashes[hash] = fname.to_s;
	
		end
		
	puts "Have found ("+hashes.count.to_s+") unique files"	
	
	return hashes;
end

def compareHashes(hashes_1, hashes_2, path_1, path_2)
	puts "Comparing "+path_1+" with "+path_2
	hashes_1.each do |hash_1, filename_1| 

		if hashes_2.key?(hash_1) == false
			puts "	"+filename_1+" not found in "+path_2;		
		end
		
	end
	puts "Comparing completed!"
end

##########################################################################################

hashes_1 = findUniqueHashesForDirectory(path_1, compare_XMP)
puts "\n"
hashes_2 = findUniqueHashesForDirectory(path_2, compare_XMP)

puts "\n---------------------------------\n\n"


compareHashes(hashes_1, hashes_2, path_1, path_2)
puts "\n"
compareHashes(hashes_2, hashes_1, path_2, path_1)

puts "\n---------------------------------\n\n"
puts "Work completed in #{Time.now - beginning} seconds"
