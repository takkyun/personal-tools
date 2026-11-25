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
		display alert "heic2jpg" message failureReport(errorMessage) as warning
	end try
end convertItems

-- The output lists every converted file, so a large batch would bury its few
-- failures; report only the "failed" lines and the closing summary line.
on failureReport(output)
	set maxFailures to 10
	set failures to {}
	set failureCount to 0
	repeat with aLine in paragraphs of output
		if aLine starts with "failed" then
			set failureCount to failureCount + 1
			if failureCount ≤ maxFailures then
				set end of failures to contents of aLine
			end if
		end if
	end repeat
	-- No "failed" line means the script itself did not run (e.g. a usage
	-- error or a missing resource), so the raw message is the useful one.
	if failureCount = 0 then
		return output
	end if
	if failureCount > maxFailures then
		set end of failures to "… and " & (failureCount - maxFailures) & " more"
	end if
	set end of failures to last paragraph of output
	set savedDelimiters to AppleScript's text item delimiters
	set AppleScript's text item delimiters to linefeed
	set report to failures as text
	set AppleScript's text item delimiters to savedDelimiters
	return report
end failureReport
