.PHONY: pdf application task refs

pdf:
	# First LaTeX run
	- pdflatex -output-directory=./build -interaction=nonstopmode thesis.tex
	# Run biber to process bibliography
	- biber --output-directory=./build build/thesis
	# Second LaTeX run to include citations
	- pdflatex -output-directory=./build -interaction=nonstopmode thesis.tex
	# Third LaTeX run to resolve all references
	- pdflatex -output-directory=./build -interaction=nonstopmode thesis.tex

application:
	- pdflatex -output-directory=./build -interaction=nonstopmode application.tex
	- biber --output-directory=./build build/application
	- pdflatex -output-directory=./build -interaction=nonstopmode application.tex
	- pdflatex -output-directory=./build -interaction=nonstopmode application.tex

task:
	- pdflatex -output-directory=./build -interaction=nonstopmode task.tex
	- biber --output-directory=./build build/task
	- pdflatex -output-directory=./build -interaction=nonstopmode task.tex
	- pdflatex -output-directory=./build -interaction=nonstopmode task.tex

refs:
	mkdir -p refs/text
	@for pdf in refs/pdf/*.pdf; do \
		if [ -f "$$pdf" ]; then \
			echo "Converting $$pdf..."; \
			pdftotext "$$pdf" "refs/text/$$(basename "$$pdf" .pdf).txt"; \
		fi; \
	done
	@echo "PDF extraction complete. Text files are in refs/text/"
