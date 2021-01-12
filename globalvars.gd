extends Node2D
var score = 0
var best = 0
var dead = false
var hiscore = 0
func save_data(data, file):

	## Create and open your file.
	var SAVE_PATH = 'user://.'+file+'.dat'
	var save_file = File.new()
	save_file.open_encrypted_with_pass(SAVE_PATH, File.WRITE,OS.get_unique_id())

	# Convert your data to a useable string-format.
	save_file.store_line(to_json(data))
	save_file.close()

func load_data(file):

	# Create your file
	var SAVE_PATH = "user://."+file+".dat"
	var save_file = File.new()

	# Return 'empty' if file doesn't exist
	if not save_file.file_exists(SAVE_PATH):
		print("ERROR: file does not exist (res://."+file+".dat)")
		return null

	# Open your file
	save_file.open_encrypted_with_pass(SAVE_PATH, File.READ, OS.get_unique_id())

	# Save data from file.
	var data = parse_json(save_file.get_as_text())

	# Close file 
	save_file.close()

	# Return data
	return data
