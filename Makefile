.PHONY: pdf application task refs diagrams

diagrams:
	@echo "Compiling Mermaid diagrams..."
	@for f in diagrams/mmd/*.mmd; do \
		name=$$(basename "$$f" .mmd); \
		echo "  mermaid: $$name"; \
		mmdc -i "$$f" -o "diagrams/img/$${name}.png" -b transparent -s 4; \
	done
	@echo "Compiling PlantUML diagrams..."
	@for f in diagrams/puml/*.puml; do \
		name=$$(basename "$$f" .puml); \
		echo "  plantuml: $$name"; \
		plantuml -tpng -Sdpi=200 -o ../img "$$f"; \
	done
	@echo "Diagrams complete."

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
