# Just build site
_site: .
	jekyll build

# Watch for changes and automatically update on localhost:4000
serve:
	jekyll serve --watch

# Test for W3C compliance
test:
	open "https://validator.w3.org/nu/?doc=http%3A%2F%2Fandrewdeorio.com%2F"

# copy files to web server
sync: _site
	find . -type f -exec chmod 644 {} \;
	find . -type d -exec chmod 755 {} \;
	rsync -rvp --delete --checksum _site/ awdeorio@web.eecs.umich.edu:public_html/

clean:
	rm -vrf _site/
	find . -name '*~' -exec rm -v {} \;

# These targets do not create any files
.PHONY : serve sync clean

# Disable built-in rules
.SUFFIXES :
