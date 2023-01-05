#/usr/bin/sh
# Build ghalatawi: Arabic autocorrect library

default: all
# Clean build files
clean:
	
backup: 
	
#create all files 
all: install install3 wheel wheel3  doc
install:
	sudo python setup.py install
install3:
	sudo python3 setup.py install
# Publish to github
publish:
	git push origin main 
pull:
	git pull origin main 

md2rst:
	pandoc -s -r markdown -w rst README.md -o README.rst
	pandoc -s -r markdown -w rst doc/features.md -o doc/features.rst
md2html:
	pandoc -s -r markdown -w html README.md -o README.html
	
wheel:
	sudo python setup.py bdist_wheel
wheel3:
	sudo python3 setup.py bdist_wheel
sdist:
	sudo python3 setup.py sdist
sdist2:
	sudo python setup.py sdist
upload:
	echo "use twine upload dist/ghalatawi-0.1.tar.gz"

test:
	python -m unittest discover tests
test3:
	python3 -m unittest discover tests
docs:
	epydoc -v --config epydoc.conf
