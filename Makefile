
all: pdf epub

epub:
	bin/sphinx-build -b singlehtml -D html_theme=epub source build
	cd build; ebook-convert index.html dzug-sprints.epub --use-auto-toc

pdf:
	bin/sphinx-build -b singlehtml source docs
	cp styles/princexml.css docs/_static/plone.css
	cd docs; prince index.html html/dzug-sprints.pdf
