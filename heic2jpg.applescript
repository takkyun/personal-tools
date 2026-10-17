-- heic2jpg droplet
-- Drop HEIC files or folders onto heic2jpg.app; it runs the bundled heic2jpg script.

on run
	set theFiles to choose file with prompt "Choose HEIC files to convert to JPEG" of type {"public.heic", "public.heif"} with multiple selections allowed
	convertItems(theFiles)
end run

on open theItems
	convertItems(theItems)
end open

on convertItems(theItems)
	set command to "/bin/bash " & quoted form of POSIX path of (path to resource "heic2jpg")
	repeat with anItem in theItems
		set command to command & " " & quoted form of POSIX path of anItem
	end repeat
	try
		set output to do shell script command & " 2>&1"
		display notification (last paragraph of output) with title "heic2jpg"
	on error errorMessage
		display alert "heic2jpg" message errorMessage as warning
	end try
end convertItems
